; DESCRIPTION: Renders a magenta box of size 61x11 starting at (28, 19).
; PLAN: r0=28(x), r1=19(y), r2=61(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 19
LDI r2, 61
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

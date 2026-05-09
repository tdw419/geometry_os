; DESCRIPTION: Renders a magenta box of size 120x56 starting at (11, 31).
; PLAN: r0=11(x), r1=31(y), r2=120(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 31
LDI r2, 120
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

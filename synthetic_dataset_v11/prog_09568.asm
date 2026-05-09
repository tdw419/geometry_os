; DESCRIPTION: Renders a magenta box of size 78x56 starting at (28, 33).
; PLAN: r0=28(x), r1=33(y), r2=78(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 33
LDI r2, 78
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

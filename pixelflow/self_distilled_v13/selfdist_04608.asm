; DESCRIPTION: Renders a magenta rectangular region spanning 56 by 80 at (288, 138).
; PLAN: r0=288(x), r1=138(y), r2=56(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 138
LDI r2, 56
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta box of size 13x105 starting at (110, 77).
; PLAN: r0=110(x), r1=77(y), r2=13(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 77
LDI r2, 13
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple box of size 77x105 starting at (125, 57).
; PLAN: r0=125(x), r1=57(y), r2=77(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 57
LDI r2, 77
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

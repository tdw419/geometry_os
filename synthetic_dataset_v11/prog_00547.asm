; DESCRIPTION: Composite: . Then Renders a purple line between points (64, 217) and (71, 239). Then Renders a purple box of size 110x51 starting at (119, 75).
; PLAN: r0=64(x1), r1=217(y1), r2=71(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=119(x), r1=75(y), r2=110(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (64, 217) and (71, 239).
; PLAN: r0=64(x1), r1=217(y1), r2=71(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 217
LDI r2, 71
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 110x51 starting at (119, 75).
; PLAN: r0=119(x), r1=75(y), r2=110(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 75
LDI r2, 110
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

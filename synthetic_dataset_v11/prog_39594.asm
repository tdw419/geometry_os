; DESCRIPTION: Composite: . Then Renders a white box of size 42x51 starting at (81, 87). Then Renders a white line between points (172, 230) and (17, 138).
; PLAN: r0=81(x), r1=87(y), r2=42(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=172(x1), r1=230(y1), r2=17(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white box of size 42x51 starting at (81, 87).
; PLAN: r0=81(x), r1=87(y), r2=42(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 87
LDI r2, 42
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (172, 230) and (17, 138).
; PLAN: r0=172(x1), r1=230(y1), r2=17(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 230
LDI r2, 17
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

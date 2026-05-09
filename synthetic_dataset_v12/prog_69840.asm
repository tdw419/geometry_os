; DESCRIPTION: Renders a yellow line between points (175, 172) and (319, 126).
; PLAN: r0=175(x1), r1=172(y1), r2=319(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 172
LDI r2, 319
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

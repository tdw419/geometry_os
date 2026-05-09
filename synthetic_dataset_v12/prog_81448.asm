; DESCRIPTION: Renders a white line between points (216, 103) and (319, 6).
; PLAN: r0=216(x1), r1=103(y1), r2=319(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 103
LDI r2, 319
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

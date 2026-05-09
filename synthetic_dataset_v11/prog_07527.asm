; DESCRIPTION: Draws a white line from (144, 71) to (216, 49).
; PLAN: r0=144(x1), r1=71(y1), r2=216(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 71
LDI r2, 216
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

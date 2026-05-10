; DESCRIPTION: Places a white line segment connecting (479, 52) to (369, 211).
; PLAN: r0=479(x1), r1=52(y1), r2=369(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 52
LDI r2, 369
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

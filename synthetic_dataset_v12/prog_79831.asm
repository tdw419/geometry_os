; DESCRIPTION: Renders a white line between points (240, 160) and (94, 98).
; PLAN: r0=240(x1), r1=160(y1), r2=94(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 160
LDI r2, 94
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

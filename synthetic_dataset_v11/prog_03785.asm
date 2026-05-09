; DESCRIPTION: Renders a white line between points (198, 240) and (180, 110).
; PLAN: r0=198(x1), r1=240(y1), r2=180(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 240
LDI r2, 180
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

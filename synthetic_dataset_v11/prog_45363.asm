; DESCRIPTION: Draws a white line from (198, 187) to (119, 12).
; PLAN: r0=198(x1), r1=187(y1), r2=119(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 187
LDI r2, 119
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

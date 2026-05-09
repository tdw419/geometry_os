; DESCRIPTION: Places a white line segment connecting (248, 187) to (198, 24).
; PLAN: r0=248(x1), r1=187(y1), r2=198(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 187
LDI r2, 198
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

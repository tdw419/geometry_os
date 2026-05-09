; DESCRIPTION: Draws a white line from (141, 128) to (38, 110).
; PLAN: r0=141(x1), r1=128(y1), r2=38(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 128
LDI r2, 38
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

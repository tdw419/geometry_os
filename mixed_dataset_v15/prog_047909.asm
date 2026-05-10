; DESCRIPTION: Draws a white line from (248, 254) to (135, 206).
; PLAN: r0=248(x1), r1=254(y1), r2=135(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 254
LDI r2, 135
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

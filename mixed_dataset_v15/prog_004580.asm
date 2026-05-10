; DESCRIPTION: Places a white line segment connecting (179, 222) to (63, 206).
; PLAN: r0=179(x1), r1=222(y1), r2=63(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 222
LDI r2, 63
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

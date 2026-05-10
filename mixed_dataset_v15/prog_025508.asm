; DESCRIPTION: Draws a white line from (325, 193) to (173, 104).
; PLAN: r0=325(x1), r1=193(y1), r2=173(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 193
LDI r2, 173
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

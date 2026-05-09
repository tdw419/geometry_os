; DESCRIPTION: Draws a white line from (176, 208) to (232, 254).
; PLAN: r0=176(x1), r1=208(y1), r2=232(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 208
LDI r2, 232
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

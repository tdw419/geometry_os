; DESCRIPTION: Draws a black line from (253, 207) to (13, 206).
; PLAN: r0=253(x1), r1=207(y1), r2=13(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 207
LDI r2, 13
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

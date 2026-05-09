; DESCRIPTION: Draws a black line from (210, 81) to (331, 206).
; PLAN: r0=210(x1), r1=81(y1), r2=331(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 81
LDI r2, 331
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

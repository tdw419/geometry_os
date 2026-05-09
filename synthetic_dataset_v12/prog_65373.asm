; DESCRIPTION: Draws a black line from (223, 230) to (439, 219).
; PLAN: r0=223(x1), r1=230(y1), r2=439(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 230
LDI r2, 439
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

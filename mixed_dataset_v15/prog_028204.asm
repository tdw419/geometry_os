; DESCRIPTION: Draws a black line from (434, 94) to (320, 233).
; PLAN: r0=434(x1), r1=94(y1), r2=320(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 94
LDI r2, 320
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black line from (320, 24) to (2, 144).
; PLAN: r0=320(x1), r1=24(y1), r2=2(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 24
LDI r2, 2
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

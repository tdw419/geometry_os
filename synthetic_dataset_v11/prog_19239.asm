; DESCRIPTION: Draws a black line from (128, 255) to (73, 130).
; PLAN: r0=128(x1), r1=255(y1), r2=73(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 255
LDI r2, 73
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

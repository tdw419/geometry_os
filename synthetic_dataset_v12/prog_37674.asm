; DESCRIPTION: Draws a black line from (435, 48) to (128, 183).
; PLAN: r0=435(x1), r1=48(y1), r2=128(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 48
LDI r2, 128
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

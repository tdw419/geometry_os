; DESCRIPTION: Draws a black line from (203, 128) to (46, 104).
; PLAN: r0=203(x1), r1=128(y1), r2=46(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 128
LDI r2, 46
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

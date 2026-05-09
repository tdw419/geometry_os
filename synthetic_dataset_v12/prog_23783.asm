; DESCRIPTION: Draws a black line from (108, 128) to (246, 84).
; PLAN: r0=108(x1), r1=128(y1), r2=246(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 128
LDI r2, 246
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

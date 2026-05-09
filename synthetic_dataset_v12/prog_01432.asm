; DESCRIPTION: Draws a blue line from (116, 28) to (469, 254).
; PLAN: r0=116(x1), r1=28(y1), r2=469(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 28
LDI r2, 469
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

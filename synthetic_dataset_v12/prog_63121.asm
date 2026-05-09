; DESCRIPTION: Draws a white line from (383, 224) to (511, 181).
; PLAN: r0=383(x1), r1=224(y1), r2=511(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 224
LDI r2, 511
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

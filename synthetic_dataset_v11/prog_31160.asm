; DESCRIPTION: Draws a white line from (130, 128) to (19, 218).
; PLAN: r0=130(x1), r1=128(y1), r2=19(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 128
LDI r2, 19
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

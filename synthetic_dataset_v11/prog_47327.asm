; DESCRIPTION: Draws a white line from (43, 128) to (204, 114).
; PLAN: r0=43(x1), r1=128(y1), r2=204(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 128
LDI r2, 204
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

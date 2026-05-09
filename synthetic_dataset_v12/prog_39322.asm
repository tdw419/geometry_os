; DESCRIPTION: Draws a white line from (97, 237) to (60, 43).
; PLAN: r0=97(x1), r1=237(y1), r2=60(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 237
LDI r2, 60
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

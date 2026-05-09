; DESCRIPTION: Draws a black line from (97, 154) to (120, 241).
; PLAN: r0=97(x1), r1=154(y1), r2=120(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 154
LDI r2, 120
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

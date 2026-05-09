; DESCRIPTION: Renders a black line between points (183, 207) and (469, 178).
; PLAN: r0=183(x1), r1=207(y1), r2=469(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 207
LDI r2, 469
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

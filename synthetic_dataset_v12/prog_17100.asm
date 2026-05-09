; DESCRIPTION: Draws a black line from (107, 148) to (68, 192).
; PLAN: r0=107(x1), r1=148(y1), r2=68(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 148
LDI r2, 68
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

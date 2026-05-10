; DESCRIPTION: Draws a black line from (136, 13) to (189, 166).
; PLAN: r0=136(x1), r1=13(y1), r2=189(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 13
LDI r2, 189
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

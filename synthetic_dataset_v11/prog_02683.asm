; DESCRIPTION: Draws a black line from (126, 211) to (189, 203).
; PLAN: r0=126(x1), r1=211(y1), r2=189(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 211
LDI r2, 189
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black line segment connecting (215, 211) to (86, 203).
; PLAN: r0=215(x1), r1=211(y1), r2=86(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 211
LDI r2, 86
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

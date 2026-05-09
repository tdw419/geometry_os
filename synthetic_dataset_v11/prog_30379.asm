; DESCRIPTION: Renders a yellow line between points (126, 32) and (37, 203).
; PLAN: r0=126(x1), r1=32(y1), r2=37(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 32
LDI r2, 37
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

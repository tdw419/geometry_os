; DESCRIPTION: Draws a yellow line from (236, 177) to (126, 203).
; PLAN: r0=236(x1), r1=177(y1), r2=126(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 177
LDI r2, 126
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (229, 203) to (126, 13).
; PLAN: r0=229(x1), r1=203(y1), r2=126(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 203
LDI r2, 126
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

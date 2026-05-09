; DESCRIPTION: Draws a yellow line from (126, 117) to (56, 246).
; PLAN: r0=126(x1), r1=117(y1), r2=56(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 117
LDI r2, 56
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

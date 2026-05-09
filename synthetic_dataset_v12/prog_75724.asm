; DESCRIPTION: Draws a magenta line from (412, 212) to (281, 203).
; PLAN: r0=412(x1), r1=212(y1), r2=281(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 212
LDI r2, 281
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

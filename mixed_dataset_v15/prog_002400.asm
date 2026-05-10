; DESCRIPTION: Draws a magenta line from (264, 215) to (5, 203).
; PLAN: r0=264(x1), r1=215(y1), r2=5(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 215
LDI r2, 5
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

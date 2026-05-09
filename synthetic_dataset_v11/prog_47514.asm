; DESCRIPTION: Draws a yellow line from (216, 116) to (207, 50).
; PLAN: r0=216(x1), r1=116(y1), r2=207(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 116
LDI r2, 207
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a yellow line from (404, 53) to (468, 88).
; PLAN: r0=404(x1), r1=53(y1), r2=468(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 53
LDI r2, 468
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

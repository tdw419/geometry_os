; DESCRIPTION: Draws a yellow line from (159, 50) to (420, 154).
; PLAN: r0=159(x1), r1=50(y1), r2=420(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 50
LDI r2, 420
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

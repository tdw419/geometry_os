; DESCRIPTION: Draws a yellow line from (450, 129) to (246, 154).
; PLAN: r0=450(x1), r1=129(y1), r2=246(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 129
LDI r2, 246
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

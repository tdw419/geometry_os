; DESCRIPTION: Draws a red line from (282, 241) to (207, 154).
; PLAN: r0=282(x1), r1=241(y1), r2=207(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 241
LDI r2, 207
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

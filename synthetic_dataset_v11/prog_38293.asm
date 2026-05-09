; DESCRIPTION: Places a red line segment connecting (154, 166) to (236, 148).
; PLAN: r0=154(x1), r1=166(y1), r2=236(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 166
LDI r2, 236
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

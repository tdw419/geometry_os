; DESCRIPTION: Composite: Creates a magenta rectangular region at (8, 12) spanning 100 by 51 pixels then Renders a yellow line between points (16, 0) and (506, 137).
; PLAN: r0=8(x), r1=12(y), r2=100(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x1), r6=0(y1), r7=506(x2), r8=137(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 8
LDI r1, 12
LDI r2, 100
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 0
LDI r7, 506
LDI r8, 137
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

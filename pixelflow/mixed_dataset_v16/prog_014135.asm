; DESCRIPTION: Composite: Creates a magenta rectangular region at (356, 158) spanning 21 by 80 pixels then Renders a magenta line between points (290, 95) and (398, 27).
; PLAN: r0=356(x), r1=158(y), r2=21(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x1), r6=95(y1), r7=398(x2), r8=27(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 158
LDI r2, 21
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 95
LDI r7, 398
LDI r8, 27
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT

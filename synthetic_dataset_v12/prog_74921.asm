; DESCRIPTION: Composite: Creates a orange rectangular region at (21, 62) spanning 26 by 30 pixels then Renders a magenta line between points (504, 29) and (282, 92).
; PLAN: r0=21(x), r1=62(y), r2=26(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x1), r6=29(y1), r7=282(x2), r8=92(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 21
LDI r1, 62
LDI r2, 26
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 29
LDI r7, 282
LDI r8, 92
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT

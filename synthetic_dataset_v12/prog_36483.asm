; DESCRIPTION: Composite: Creates a green rectangular region at (216, 116) spanning 56 by 64 pixels then Renders a yellow line between points (276, 203) and (232, 42).
; PLAN: r0=216(x), r1=116(y), r2=56(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x1), r6=203(y1), r7=232(x2), r8=42(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 116
LDI r2, 56
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 203
LDI r7, 232
LDI r8, 42
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

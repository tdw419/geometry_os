; DESCRIPTION: Composite: Creates a white rectangular region at (67, 190) spanning 50 by 12 pixels then Places a orange line segment connecting (249, 144) to (464, 68).
; PLAN: r0=67(x), r1=190(y), r2=50(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x1), r6=144(y1), r7=464(x2), r8=68(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 190
LDI r2, 50
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 144
LDI r7, 464
LDI r8, 68
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

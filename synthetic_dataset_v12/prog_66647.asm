; DESCRIPTION: Composite: Creates a orange circular shape at (265, 156) with radius 21 then Places a white 67x116 rectangle at position (228, 14) then Places a magenta line segment connecting (465, 173) to (439, 150).
; PLAN: r0=265(x), r1=156(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x), r6=14(y), r7=67(width), r8=116(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=465(x1), r11=173(y1), r12=439(x2), r13=150(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 156
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 14
LDI r7, 67
LDI r8, 116
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 173
LDI r12, 439
LDI r13, 150
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT

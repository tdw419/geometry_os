; DESCRIPTION: Composite: Places a orange 108x75 rectangle at position (265, 74) then Creates a orange circular shape at (99, 85) with radius 72 then Renders a magenta line between points (409, 12) and (39, 15).
; PLAN: r0=265(x), r1=74(y), r2=108(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=85(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=409(x1), r11=12(y1), r12=39(x2), r13=15(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 74
LDI r2, 108
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 85
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 409
LDI r11, 12
LDI r12, 39
LDI r13, 15
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT

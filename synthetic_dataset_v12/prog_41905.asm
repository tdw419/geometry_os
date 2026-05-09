; DESCRIPTION: Composite: Renders a magenta disk with center (301, 119) and radius 67 then Places a magenta 63x64 rectangle at position (48, 170) then Draws a orange line from (115, 79) to (258, 173).
; PLAN: r0=301(x), r1=119(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=170(y), r7=63(width), r8=64(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=115(x1), r11=79(y1), r12=258(x2), r13=173(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 119
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 170
LDI r7, 63
LDI r8, 64
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 79
LDI r12, 258
LDI r13, 173
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT

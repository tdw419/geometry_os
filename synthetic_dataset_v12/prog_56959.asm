; DESCRIPTION: Composite: Places a orange 14x56 rectangle at position (105, 68) then Places a cyan circle of radius 68 at center (326, 184) then Draws a green line from (5, 241) to (130, 224).
; PLAN: r0=105(x), r1=68(y), r2=14(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x), r6=184(y), r7=68(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=5(x1), r11=241(y1), r12=130(x2), r13=224(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 68
LDI r2, 14
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 184
LDI r7, 68
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 5
LDI r11, 241
LDI r12, 130
LDI r13, 224
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT

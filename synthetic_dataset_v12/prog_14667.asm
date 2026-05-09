; DESCRIPTION: Composite: Places a cyan circle of radius 76 at center (152, 125) then Places a yellow 93x18 rectangle at position (283, 73) then Places a orange line segment connecting (196, 87) to (325, 172).
; PLAN: r0=152(x), r1=125(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=73(y), r7=93(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=196(x1), r11=87(y1), r12=325(x2), r13=172(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 125
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 73
LDI r7, 93
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 87
LDI r12, 325
LDI r13, 172
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT

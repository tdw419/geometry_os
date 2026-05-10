; DESCRIPTION: Composite: Places a orange dot at position (412, 86) then Places a cyan 97x104 rectangle at position (323, 123) then Places a black line segment connecting (205, 45) to (414, 204).
; PLAN: r0=412(x), r1=86(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=323(x), r6=123(y), r7=97(width), r8=104(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x1), r11=45(y1), r12=414(x2), r13=204(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 412
LDI r1, 86
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 323
LDI r6, 123
LDI r7, 97
LDI r8, 104
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 45
LDI r12, 414
LDI r13, 204
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT

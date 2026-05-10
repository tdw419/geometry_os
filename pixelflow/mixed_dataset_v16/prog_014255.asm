; DESCRIPTION: Composite: Places a orange circle of radius 78 at center (123, 109) then Renders a blue box of size 83x22 starting at (7, 93) then Places a red line segment connecting (352, 231) to (2, 192).
; PLAN: r0=123(x), r1=109(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x), r6=93(y), r7=83(width), r8=22(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=352(x1), r11=231(y1), r12=2(x2), r13=192(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 109
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 93
LDI r7, 83
LDI r8, 22
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 231
LDI r12, 2
LDI r13, 192
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT

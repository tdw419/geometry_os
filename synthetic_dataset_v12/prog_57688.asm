; DESCRIPTION: Composite: Places a cyan circle of radius 10 at center (50, 68) then Renders a magenta line between points (440, 231) and (314, 100) then Places a black 84x50 rectangle at position (422, 99).
; PLAN: r0=50(x), r1=68(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=440(x1), r6=231(y1), r7=314(x2), r8=100(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=422(x), r11=99(y), r12=84(width), r13=50(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 68
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 440
LDI r6, 231
LDI r7, 314
LDI r8, 100
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 99
LDI r12, 84
LDI r13, 50
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

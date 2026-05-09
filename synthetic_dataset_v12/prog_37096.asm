; DESCRIPTION: Composite: Places a orange 55x77 rectangle at position (123, 104) then Renders a magenta line between points (345, 253) and (263, 50) then Places a yellow circle of radius 79 at center (273, 150).
; PLAN: r0=123(x), r1=104(y), r2=55(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x1), r6=253(y1), r7=263(x2), r8=50(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=273(x), r11=150(y), r12=79(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 123
LDI r1, 104
LDI r2, 55
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 253
LDI r7, 263
LDI r8, 50
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 150
LDI r12, 79
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT

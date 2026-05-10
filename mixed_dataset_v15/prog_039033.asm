; DESCRIPTION: Composite: Places a magenta line segment connecting (440, 225) to (502, 0) then Places a black 67x10 rectangle at position (305, 92) then Renders a yellow disk with center (253, 118) and radius 44.
; PLAN: r0=440(x1), r1=225(y1), r2=502(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=305(x), r6=92(y), r7=67(width), r8=10(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=253(x), r11=118(y), r12=44(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 440
LDI r1, 225
LDI r2, 502
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 92
LDI r7, 67
LDI r8, 10
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 118
LDI r12, 44
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT

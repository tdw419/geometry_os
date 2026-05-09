; DESCRIPTION: Composite: Creates a blue circular shape at (337, 56) with radius 41 then Renders a black box of size 104x103 starting at (120, 16) then Renders a red line between points (288, 162) and (106, 109).
; PLAN: r0=337(x), r1=56(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=16(y), r7=104(width), r8=103(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=288(x1), r11=162(y1), r12=106(x2), r13=109(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 56
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 16
LDI r7, 104
LDI r8, 103
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 162
LDI r12, 106
LDI r13, 109
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Draws a white line from (46, 103) to (86, 159) then Places a cyan circle of radius 69 at center (160, 133) then Renders a yellow box of size 29x30 starting at (169, 25).
; PLAN: r0=46(x1), r1=103(y1), r2=86(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=133(y), r7=69(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=169(x), r11=25(y), r12=29(width), r13=30(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 103
LDI r2, 86
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 133
LDI r7, 69
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 169
LDI r11, 25
LDI r12, 29
LDI r13, 30
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT

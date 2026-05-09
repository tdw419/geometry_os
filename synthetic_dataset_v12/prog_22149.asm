; DESCRIPTION: Composite: Draws a blue line from (186, 168) to (400, 176) then Places a red circle of radius 13 at center (157, 48) then Draws a yellow rectangle at (168, 184) with width 46 and height 32.
; PLAN: r0=186(x1), r1=168(y1), r2=400(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=48(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=168(x), r11=184(y), r12=46(width), r13=32(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 168
LDI r2, 400
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 48
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 168
LDI r11, 184
LDI r12, 46
LDI r13, 32
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT

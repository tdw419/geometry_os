; DESCRIPTION: Composite: Places a green circle of radius 32 at center (342, 154) then Places a yellow 104x103 rectangle at position (164, 86) then Renders a blue line between points (418, 34) and (410, 123).
; PLAN: r0=342(x), r1=154(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=86(y), r7=104(width), r8=103(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x1), r11=34(y1), r12=410(x2), r13=123(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 154
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 86
LDI r7, 104
LDI r8, 103
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 34
LDI r12, 410
LDI r13, 123
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

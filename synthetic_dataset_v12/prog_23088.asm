; DESCRIPTION: Composite: Places a black 16x49 rectangle at position (34, 40) then Renders a magenta disk with center (368, 115) and radius 39 then Draws a red line from (504, 136) to (102, 220).
; PLAN: r0=34(x), r1=40(y), r2=16(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=115(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=504(x1), r11=136(y1), r12=102(x2), r13=220(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 40
LDI r2, 16
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 115
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 504
LDI r11, 136
LDI r12, 102
LDI r13, 220
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT

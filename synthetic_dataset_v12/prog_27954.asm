; DESCRIPTION: Composite: Draws a green line from (308, 104) to (338, 197) then Renders a blue disk with center (221, 85) and radius 65 then Creates a cyan rectangular region at (456, 131) spanning 16 by 17 pixels.
; PLAN: r0=308(x1), r1=104(y1), r2=338(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=85(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=456(x), r11=131(y), r12=16(width), r13=17(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 104
LDI r2, 338
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 85
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 456
LDI r11, 131
LDI r12, 16
LDI r13, 17
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT

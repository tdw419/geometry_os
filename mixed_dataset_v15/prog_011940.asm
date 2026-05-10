; DESCRIPTION: Composite: Places a black 84x94 rectangle at position (197, 159) then Renders a yellow disk with center (405, 117) and radius 40 then Renders a blue line between points (85, 70) and (401, 201).
; PLAN: r0=197(x), r1=159(y), r2=84(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=117(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=85(x1), r11=70(y1), r12=401(x2), r13=201(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 159
LDI r2, 84
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 117
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 85
LDI r11, 70
LDI r12, 401
LDI r13, 201
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

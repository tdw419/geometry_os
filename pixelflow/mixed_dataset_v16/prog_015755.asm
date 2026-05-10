; DESCRIPTION: Composite: Places a purple line segment connecting (5, 125) to (423, 94) then Renders a magenta disk with center (149, 61) and radius 57 then Places a cyan 67x33 rectangle at position (129, 33).
; PLAN: r0=5(x1), r1=125(y1), r2=423(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=61(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=129(x), r11=33(y), r12=67(width), r13=33(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 125
LDI r2, 423
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 61
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 129
LDI r11, 33
LDI r12, 67
LDI r13, 33
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT

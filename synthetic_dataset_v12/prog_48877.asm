; DESCRIPTION: Composite: Renders a red line between points (34, 25) and (436, 213) then Renders a white disk with center (110, 109) and radius 70 then Places a purple 10x107 rectangle at position (94, 142).
; PLAN: r0=34(x1), r1=25(y1), r2=436(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=109(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=94(x), r11=142(y), r12=10(width), r13=107(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 25
LDI r2, 436
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 109
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 94
LDI r11, 142
LDI r12, 10
LDI r13, 107
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

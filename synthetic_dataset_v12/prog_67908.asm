; DESCRIPTION: Composite: Creates a green circular shape at (426, 88) with radius 29 then Places a cyan 110x115 rectangle at position (292, 130) then Renders a blue line between points (422, 169) and (78, 231).
; PLAN: r0=426(x), r1=88(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=130(y), r7=110(width), r8=115(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x1), r11=169(y1), r12=78(x2), r13=231(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 88
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 130
LDI r7, 110
LDI r8, 115
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 169
LDI r12, 78
LDI r13, 231
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT

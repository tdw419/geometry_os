; DESCRIPTION: Composite: Draws a cyan rectangle at (369, 176) with width 115 and height 16 then Renders a black line between points (425, 186) and (39, 67) then Creates a green circular shape at (442, 225) with radius 24.
; PLAN: r0=369(x), r1=176(y), r2=115(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x1), r6=186(y1), r7=39(x2), r8=67(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=225(y), r12=24(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 369
LDI r1, 176
LDI r2, 115
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 186
LDI r7, 39
LDI r8, 67
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 225
LDI r12, 24
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT

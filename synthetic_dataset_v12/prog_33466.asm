; DESCRIPTION: Composite: Creates a blue circular shape at (220, 189) with radius 44 then Renders a cyan line between points (75, 57) and (311, 89) then Draws a cyan rectangle at (249, 139) with width 119 and height 18.
; PLAN: r0=220(x), r1=189(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x1), r6=57(y1), r7=311(x2), r8=89(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=249(x), r11=139(y), r12=119(width), r13=18(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 189
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 57
LDI r7, 311
LDI r8, 89
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 139
LDI r12, 119
LDI r13, 18
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT

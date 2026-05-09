; DESCRIPTION: Composite: Places a cyan 81x29 rectangle at position (33, 57) then Renders a cyan line between points (386, 19) and (369, 252) then Draws a white circle centered at (171, 53) with radius 12.
; PLAN: r0=33(x), r1=57(y), r2=81(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x1), r6=19(y1), r7=369(x2), r8=252(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=171(x), r11=53(y), r12=12(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 33
LDI r1, 57
LDI r2, 81
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 19
LDI r7, 369
LDI r8, 252
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 53
LDI r12, 12
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

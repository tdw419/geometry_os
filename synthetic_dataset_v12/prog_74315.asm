; DESCRIPTION: Composite: Renders a green box of size 57x67 starting at (433, 176) then Renders a black line between points (151, 21) and (209, 121) then Places a black circle of radius 31 at center (225, 162).
; PLAN: r0=433(x), r1=176(y), r2=57(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x1), r6=21(y1), r7=209(x2), r8=121(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=162(y), r12=31(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 433
LDI r1, 176
LDI r2, 57
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 21
LDI r7, 209
LDI r8, 121
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 162
LDI r12, 31
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

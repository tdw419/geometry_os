; DESCRIPTION: Composite: Places a cyan circle of radius 55 at center (311, 113) then Places a yellow 39x40 rectangle at position (313, 99) then Places a green line segment connecting (57, 95) to (44, 143).
; PLAN: r0=311(x), r1=113(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=313(x), r6=99(y), r7=39(width), r8=40(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=57(x1), r11=95(y1), r12=44(x2), r13=143(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 113
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 313
LDI r6, 99
LDI r7, 39
LDI r8, 40
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 95
LDI r12, 44
LDI r13, 143
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT

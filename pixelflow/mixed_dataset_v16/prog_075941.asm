; DESCRIPTION: Composite: Creates a orange circular shape at (91, 70) with radius 51 then Places a cyan 109x24 rectangle at position (13, 22) then Renders a red line between points (151, 226) and (119, 66).
; PLAN: r0=91(x), r1=70(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x), r6=22(y), r7=109(width), r8=24(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=151(x1), r11=226(y1), r12=119(x2), r13=66(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 70
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 22
LDI r7, 109
LDI r8, 24
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 226
LDI r12, 119
LDI r13, 66
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT

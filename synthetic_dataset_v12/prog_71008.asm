; DESCRIPTION: Composite: Renders a cyan line between points (370, 145) and (329, 132) then Renders a cyan box of size 67x14 starting at (153, 29) then Renders a green disk with center (99, 121) and radius 67.
; PLAN: r0=370(x1), r1=145(y1), r2=329(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=29(y), r7=67(width), r8=14(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x), r11=121(y), r12=67(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 370
LDI r1, 145
LDI r2, 329
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 29
LDI r7, 67
LDI r8, 14
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 121
LDI r12, 67
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT

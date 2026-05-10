; DESCRIPTION: Composite: Places a magenta dot at position (334, 25) then Places a yellow 20x68 rectangle at position (88, 138) then Places a green circle of radius 34 at center (93, 80).
; PLAN: r0=334(x), r1=25(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=138(y), r7=20(width), r8=68(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=93(x), r11=80(y), r12=34(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 334
LDI r1, 25
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 88
LDI r6, 138
LDI r7, 20
LDI r8, 68
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 80
LDI r12, 34
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT

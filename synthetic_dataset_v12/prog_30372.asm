; DESCRIPTION: Composite: Draws a yellow rectangle at (168, 107) with width 99 and height 106 then Places a white circle of radius 68 at center (179, 161) then Places a cyan line segment connecting (423, 34) to (223, 192).
; PLAN: r0=168(x), r1=107(y), r2=99(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=161(y), r7=68(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=423(x1), r11=34(y1), r12=223(x2), r13=192(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 107
LDI r2, 99
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 161
LDI r7, 68
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 423
LDI r11, 34
LDI r12, 223
LDI r13, 192
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Renders a cyan disk with center (75, 72) and radius 46 then Renders a magenta line between points (463, 187) and (423, 40) then Draws a red rectangle at (29, 123) with width 102 and height 112.
; PLAN: r0=75(x), r1=72(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x1), r6=187(y1), r7=423(x2), r8=40(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=29(x), r11=123(y), r12=102(width), r13=112(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 72
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 187
LDI r7, 423
LDI r8, 40
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 29
LDI r11, 123
LDI r12, 102
LDI r13, 112
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

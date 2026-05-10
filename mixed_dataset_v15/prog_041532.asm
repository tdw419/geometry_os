; DESCRIPTION: Composite: Draws a white line from (327, 154) to (38, 210) then Renders a white box of size 115x78 starting at (127, 3) then Renders a magenta disk with center (106, 66) and radius 27.
; PLAN: r0=327(x1), r1=154(y1), r2=38(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=3(y), r7=115(width), r8=78(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=106(x), r11=66(y), r12=27(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 327
LDI r1, 154
LDI r2, 38
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 3
LDI r7, 115
LDI r8, 78
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 66
LDI r12, 27
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT

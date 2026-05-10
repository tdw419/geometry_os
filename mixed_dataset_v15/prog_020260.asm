; DESCRIPTION: Composite: Renders a magenta disk with center (129, 138) and radius 78 then Draws a yellow line from (371, 208) to (344, 213) then Renders a red box of size 51x106 starting at (33, 120).
; PLAN: r0=129(x), r1=138(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x1), r6=208(y1), r7=344(x2), r8=213(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=33(x), r11=120(y), r12=51(width), r13=106(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 138
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 208
LDI r7, 344
LDI r8, 213
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 120
LDI r12, 51
LDI r13, 106
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Renders a green box of size 107x115 starting at (49, 67) then Draws a orange circle centered at (202, 73) with radius 33 then Draws a magenta line from (186, 21) to (327, 175).
; PLAN: r0=49(x), r1=67(y), r2=107(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x), r6=73(y), r7=33(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=186(x1), r11=21(y1), r12=327(x2), r13=175(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 67
LDI r2, 107
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 73
LDI r7, 33
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 186
LDI r11, 21
LDI r12, 327
LDI r13, 175
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT

; DESCRIPTION: Composite: Renders a cyan line between points (441, 94) and (401, 181) then Places a green dot at position (333, 230) then Draws a red rectangle at (222, 225) with width 13 and height 27.
; PLAN: r0=441(x1), r1=94(y1), r2=401(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=230(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=222(x), r11=225(y), r12=13(width), r13=27(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 94
LDI r2, 401
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 230
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 222
LDI r11, 225
LDI r12, 13
LDI r13, 27
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

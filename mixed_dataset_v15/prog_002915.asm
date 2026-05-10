; DESCRIPTION: Composite: Draws a blue circle centered at (405, 197) with radius 39 then Draws a blue line from (370, 173) to (309, 209) then Renders a black box of size 89x98 starting at (62, 106).
; PLAN: r0=405(x), r1=197(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x1), r6=173(y1), r7=309(x2), r8=209(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=62(x), r11=106(y), r12=89(width), r13=98(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 197
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 173
LDI r7, 309
LDI r8, 209
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 106
LDI r12, 89
LDI r13, 98
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

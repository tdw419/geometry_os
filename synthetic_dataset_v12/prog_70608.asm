; DESCRIPTION: Composite: Renders a green line between points (58, 24) and (53, 47) then Draws a white rectangle at (56, 29) with width 63 and height 14 then Sets a single blue pixel at (396, 209).
; PLAN: r0=58(x1), r1=24(y1), r2=53(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=29(y), r7=63(width), r8=14(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=396(x), r11=209(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 58
LDI r1, 24
LDI r2, 53
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 29
LDI r7, 63
LDI r8, 14
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 209
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

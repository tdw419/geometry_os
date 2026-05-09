; DESCRIPTION: Composite: Draws a red circle centered at (209, 136) with radius 20 then Draws a black line from (306, 67) to (184, 34) then Places a magenta dot at position (63, 37).
; PLAN: r0=209(x), r1=136(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x1), r6=67(y1), r7=184(x2), r8=34(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=63(x), r11=37(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 209
LDI r1, 136
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 67
LDI r7, 184
LDI r8, 34
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 37
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

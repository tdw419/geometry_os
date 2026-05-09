; DESCRIPTION: Composite: Places a green circle of radius 68 at center (266, 180) then Draws a purple rectangle at (470, 32) with width 34 and height 119 then Places a yellow dot at position (342, 223).
; PLAN: r0=266(x), r1=180(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=470(x), r6=32(y), r7=34(width), r8=119(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=342(x), r11=223(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 266
LDI r1, 180
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 470
LDI r6, 32
LDI r7, 34
LDI r8, 119
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 223
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

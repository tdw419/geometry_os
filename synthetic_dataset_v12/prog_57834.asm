; DESCRIPTION: Composite: Draws a yellow circle centered at (217, 105) with radius 54 then Draws a green rectangle at (180, 186) with width 47 and height 48 then Places a blue dot at position (400, 233).
; PLAN: r0=217(x), r1=105(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=180(x), r6=186(y), r7=47(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=400(x), r11=233(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 217
LDI r1, 105
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 180
LDI r6, 186
LDI r7, 47
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 233
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT

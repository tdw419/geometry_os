; DESCRIPTION: Composite: Places a blue dot at position (184, 178) then Draws a green circle centered at (165, 61) with radius 51 then Places a orange 15x54 rectangle at position (295, 38).
; PLAN: r0=184(x), r1=178(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=61(y), r7=51(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x), r11=38(y), r12=15(width), r13=54(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 178
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 165
LDI r6, 61
LDI r7, 51
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 38
LDI r12, 15
LDI r13, 54
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

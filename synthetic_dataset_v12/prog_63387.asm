; DESCRIPTION: Composite: Draws a green circle centered at (313, 111) with radius 68 then Draws a yellow rectangle at (129, 132) with width 33 and height 57 then Places a black dot at position (234, 146).
; PLAN: r0=313(x), r1=111(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=132(y), r7=33(width), r8=57(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=146(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 313
LDI r1, 111
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 132
LDI r7, 33
LDI r8, 57
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 146
LDI r12, 0x000000
PSET r10, r11, r12
HALT

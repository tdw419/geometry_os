; DESCRIPTION: Composite: Draws a red circle centered at (404, 55) with radius 16 then Places a magenta dot at position (187, 226) then Draws a yellow rectangle at (204, 106) with width 17 and height 96.
; PLAN: r0=404(x), r1=55(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x), r6=226(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=204(x), r11=106(y), r12=17(width), r13=96(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 55
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 226
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 204
LDI r11, 106
LDI r12, 17
LDI r13, 96
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT

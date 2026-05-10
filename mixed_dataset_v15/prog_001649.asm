; DESCRIPTION: Composite: Draws a blue rectangle at (290, 119) with width 59 and height 50 then Places a white dot at position (54, 199) then Draws a white circle centered at (404, 171) with radius 34.
; PLAN: r0=290(x), r1=119(y), r2=59(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x), r6=199(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=404(x), r11=171(y), r12=34(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 119
LDI r2, 59
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 199
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 404
LDI r11, 171
LDI r12, 34
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

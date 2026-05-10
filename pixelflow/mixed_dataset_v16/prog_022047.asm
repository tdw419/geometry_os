; DESCRIPTION: Composite: Creates a red circular shape at (464, 229) with radius 26 then Places a blue dot at position (218, 248) then Draws a orange rectangle at (404, 113) with width 83 and height 96.
; PLAN: r0=464(x), r1=229(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=248(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=404(x), r11=113(y), r12=83(width), r13=96(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 229
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 248
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 404
LDI r11, 113
LDI r12, 83
LDI r13, 96
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT

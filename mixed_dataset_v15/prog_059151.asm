; DESCRIPTION: Composite: Places a orange dot at position (329, 50) then Places a orange circle of radius 36 at center (223, 150) then Draws a yellow rectangle at (305, 7) with width 88 and height 103.
; PLAN: r0=329(x), r1=50(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=150(y), r7=36(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=305(x), r11=7(y), r12=88(width), r13=103(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 50
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 223
LDI r6, 150
LDI r7, 36
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 305
LDI r11, 7
LDI r12, 88
LDI r13, 103
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT

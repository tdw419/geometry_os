; DESCRIPTION: Composite: Creates a green circular shape at (182, 188) with radius 63 then Places a green dot at position (347, 180) then Renders a red box of size 86x96 starting at (329, 84).
; PLAN: r0=182(x), r1=188(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x), r6=180(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=329(x), r11=84(y), r12=86(width), r13=96(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 188
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 180
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 329
LDI r11, 84
LDI r12, 86
LDI r13, 96
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

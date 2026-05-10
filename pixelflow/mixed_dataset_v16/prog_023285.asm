; DESCRIPTION: Composite: Renders a red box of size 95x48 starting at (107, 68) then Draws a orange circle centered at (129, 153) with radius 80 then Sets a single red pixel at (63, 81).
; PLAN: r0=107(x), r1=68(y), r2=95(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=153(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=63(x), r11=81(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 107
LDI r1, 68
LDI r2, 95
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 153
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 63
LDI r11, 81
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT

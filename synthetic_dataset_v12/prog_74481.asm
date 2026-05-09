; DESCRIPTION: Composite: Sets a single green pixel at (131, 11) then Renders a orange disk with center (222, 138) and radius 54 then Renders a red box of size 114x117 starting at (188, 124).
; PLAN: r0=131(x), r1=11(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=222(x), r6=138(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=188(x), r11=124(y), r12=114(width), r13=117(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 11
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 222
LDI r6, 138
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 188
LDI r11, 124
LDI r12, 114
LDI r13, 117
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT

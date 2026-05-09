; DESCRIPTION: Composite: Places a yellow dot at position (459, 184) then Draws a cyan circle centered at (68, 44) with radius 27 then Renders a green line between points (407, 173) and (20, 39).
; PLAN: r0=459(x), r1=184(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=44(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=407(x1), r11=173(y1), r12=20(x2), r13=39(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 184
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 68
LDI r6, 44
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 407
LDI r11, 173
LDI r12, 20
LDI r13, 39
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT

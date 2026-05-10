; DESCRIPTION: Composite: Places a white dot at position (289, 225) then Places a orange 31x59 rectangle at position (385, 103) then Places a orange circle of radius 21 at center (182, 40).
; PLAN: r0=289(x), r1=225(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=103(y), r7=31(width), r8=59(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=182(x), r11=40(y), r12=21(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 289
LDI r1, 225
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 385
LDI r6, 103
LDI r7, 31
LDI r8, 59
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 40
LDI r12, 21
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT

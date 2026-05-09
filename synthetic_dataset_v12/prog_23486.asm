; DESCRIPTION: Composite: Sets a single red pixel at (151, 44) then Places a yellow 55x48 rectangle at position (162, 180) then Draws a black circle centered at (225, 59) with radius 33.
; PLAN: r0=151(x), r1=44(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=180(y), r7=55(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=225(x), r11=59(y), r12=33(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 151
LDI r1, 44
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 162
LDI r6, 180
LDI r7, 55
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 59
LDI r12, 33
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT

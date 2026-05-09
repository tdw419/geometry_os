; DESCRIPTION: Composite: Sets a single yellow pixel at (339, 59) then Places a white 13x113 rectangle at position (46, 69) then Draws a orange circle centered at (439, 168) with radius 44.
; PLAN: r0=339(x), r1=59(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=46(x), r6=69(y), r7=13(width), r8=113(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x), r11=168(y), r12=44(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 339
LDI r1, 59
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 46
LDI r6, 69
LDI r7, 13
LDI r8, 113
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 168
LDI r12, 44
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT

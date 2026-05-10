; DESCRIPTION: Composite: Places a blue 39x73 rectangle at position (266, 107) then Renders a orange line between points (69, 254) and (341, 183) then Places a orange dot at position (338, 218).
; PLAN: r0=266(x), r1=107(y), r2=39(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x1), r6=254(y1), r7=341(x2), r8=183(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=338(x), r11=218(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 266
LDI r1, 107
LDI r2, 39
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 254
LDI r7, 341
LDI r8, 183
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 218
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

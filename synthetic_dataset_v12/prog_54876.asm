; DESCRIPTION: Composite: Sets a single magenta pixel at (244, 93) then Places a black 68x83 rectangle at position (308, 170) then Renders a orange disk with center (412, 79) and radius 36.
; PLAN: r0=244(x), r1=93(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=170(y), r7=68(width), r8=83(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=412(x), r11=79(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 244
LDI r1, 93
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 308
LDI r6, 170
LDI r7, 68
LDI r8, 83
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 79
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT

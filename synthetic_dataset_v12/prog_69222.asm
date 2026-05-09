; DESCRIPTION: Composite: Places a green 26x105 rectangle at position (388, 95) then Renders a orange disk with center (398, 131) and radius 45 then Places a orange dot at position (171, 189).
; PLAN: r0=388(x), r1=95(y), r2=26(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=398(x), r6=131(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x), r11=189(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 388
LDI r1, 95
LDI r2, 26
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 131
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 189
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

; DESCRIPTION: Composite: Sets a single cyan pixel at (302, 187) then Places a red 48x73 rectangle at position (299, 104) then Places a white circle of radius 14 at center (108, 45).
; PLAN: r0=302(x), r1=187(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=104(y), r7=48(width), r8=73(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=108(x), r11=45(y), r12=14(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 302
LDI r1, 187
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 299
LDI r6, 104
LDI r7, 48
LDI r8, 73
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 45
LDI r12, 14
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

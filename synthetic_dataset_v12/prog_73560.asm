; DESCRIPTION: Composite: Places a white 109x107 rectangle at position (259, 59) then Sets a single cyan pixel at (349, 72) then Draws a white circle centered at (164, 145) with radius 23.
; PLAN: r0=259(x), r1=59(y), r2=109(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x), r6=72(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=164(x), r11=145(y), r12=23(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 59
LDI r2, 109
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 72
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 164
LDI r11, 145
LDI r12, 23
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT

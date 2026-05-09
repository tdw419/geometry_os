; DESCRIPTION: Composite: Places a white 57x115 rectangle at position (310, 76) then Places a green circle of radius 80 at center (140, 82) then Sets a single black pixel at (166, 196).
; PLAN: r0=310(x), r1=76(y), r2=57(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x), r6=82(y), r7=80(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=166(x), r11=196(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 310
LDI r1, 76
LDI r2, 57
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 82
LDI r7, 80
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 166
LDI r11, 196
LDI r12, 0x000000
PSET r10, r11, r12
HALT

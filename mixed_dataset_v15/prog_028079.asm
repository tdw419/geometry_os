; DESCRIPTION: Composite: Draws a white rectangle at (24, 146) with width 104 and height 91 then Places a green dot at position (93, 12).
; PLAN: r0=24(x), r1=146(y), r2=104(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=12(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 24
LDI r1, 146
LDI r2, 104
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 12
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

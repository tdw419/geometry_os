; DESCRIPTION: Composite: Places a green line segment connecting (286, 165) to (421, 197) then Draws a orange circle centered at (356, 159) with radius 67 then Places a orange dot at position (362, 98).
; PLAN: r0=286(x1), r1=165(y1), r2=421(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=159(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=362(x), r11=98(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 165
LDI r2, 421
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 159
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 362
LDI r11, 98
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

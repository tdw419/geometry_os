; DESCRIPTION: Composite: Places a orange dot at position (72, 178) then Places a green circle of radius 41 at center (84, 197).
; PLAN: r0=72(x), r1=178(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=84(x), r6=197(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 72
LDI r1, 178
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 84
LDI r6, 197
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Places a orange dot at position (310, 250) then Places a yellow 23x17 rectangle at position (350, 218).
; PLAN: r0=310(x), r1=250(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=218(y), r7=23(width), r8=17(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 250
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 350
LDI r6, 218
LDI r7, 23
LDI r8, 17
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT

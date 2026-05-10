; DESCRIPTION: Composite: Places a green dot at position (472, 187) then Places a orange circle of radius 60 at center (374, 98).
; PLAN: r0=472(x), r1=187(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=98(y), r7=60(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 472
LDI r1, 187
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 374
LDI r6, 98
LDI r7, 60
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

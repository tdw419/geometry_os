; DESCRIPTION: Composite: Renders a black box of size 45x24 starting at (186, 232) then Places a orange dot at position (470, 32).
; PLAN: r0=186(x), r1=232(y), r2=45(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x), r6=32(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 186
LDI r1, 232
LDI r2, 45
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 32
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT

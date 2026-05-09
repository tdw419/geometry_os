; DESCRIPTION: Composite: Renders a orange disk with center (472, 193) and radius 15 then Places a green dot at position (350, 146).
; PLAN: r0=472(x), r1=193(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=146(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 472
LDI r1, 193
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 146
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

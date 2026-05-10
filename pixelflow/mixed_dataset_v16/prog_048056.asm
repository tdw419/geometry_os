; DESCRIPTION: Composite: Places a magenta dot at position (147, 232) then Renders a orange disk with center (210, 108) and radius 60.
; PLAN: r0=147(x), r1=232(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=108(y), r7=60(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 147
LDI r1, 232
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 210
LDI r6, 108
LDI r7, 60
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Places a blue dot at position (174, 245) then Renders a red disk with center (68, 178) and radius 63.
; PLAN: r0=174(x), r1=245(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=178(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 174
LDI r1, 245
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 68
LDI r6, 178
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

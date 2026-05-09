; DESCRIPTION: Composite: Renders a red disk with center (402, 232) and radius 24 then Places a magenta dot at position (479, 231).
; PLAN: r0=402(x), r1=232(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x), r6=231(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 402
LDI r1, 232
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 231
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT

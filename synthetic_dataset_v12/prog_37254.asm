; DESCRIPTION: Composite: Places a cyan dot at position (208, 224) then Places a blue circle of radius 69 at center (358, 146).
; PLAN: r0=208(x), r1=224(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=358(x), r6=146(y), r7=69(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 208
LDI r1, 224
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 358
LDI r6, 146
LDI r7, 69
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

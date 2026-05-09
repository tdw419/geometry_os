; DESCRIPTION: Composite: Renders a red disk with center (192, 91) and radius 54 then Sets a single cyan pixel at (48, 166).
; PLAN: r0=192(x), r1=91(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=166(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 192
LDI r1, 91
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 166
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

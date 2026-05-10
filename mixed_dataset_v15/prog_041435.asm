; DESCRIPTION: Composite: Renders a magenta disk with center (91, 35) and radius 26 then Sets a single cyan pixel at (174, 244).
; PLAN: r0=91(x), r1=35(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x), r6=244(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 91
LDI r1, 35
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 244
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

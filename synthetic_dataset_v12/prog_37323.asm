; DESCRIPTION: Composite: Draws a green circle centered at (395, 150) with radius 66 then Places a cyan dot at position (281, 225).
; PLAN: r0=395(x), r1=150(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=225(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 395
LDI r1, 150
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 225
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Creates a green circular shape at (108, 180) with radius 65 then Places a red dot at position (27, 177).
; PLAN: r0=108(x), r1=180(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x), r6=177(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 108
LDI r1, 180
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 177
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

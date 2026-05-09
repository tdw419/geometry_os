; DESCRIPTION: Composite: Draws a cyan circle centered at (263, 144) with radius 27 then Places a red dot at position (500, 255).
; PLAN: r0=263(x), r1=144(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=500(x), r6=255(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 263
LDI r1, 144
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 500
LDI r6, 255
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

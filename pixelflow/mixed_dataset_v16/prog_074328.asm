; DESCRIPTION: Composite: Sets a single cyan pixel at (372, 133) then Creates a red circular shape at (256, 85) with radius 25.
; PLAN: r0=372(x), r1=133(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=85(y), r7=25(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 133
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 256
LDI r6, 85
LDI r7, 25
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Sets a single red pixel at (210, 95) then Creates a green circular shape at (401, 64) with radius 46.
; PLAN: r0=210(x), r1=95(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=401(x), r6=64(y), r7=46(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 210
LDI r1, 95
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 401
LDI r6, 64
LDI r7, 46
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT

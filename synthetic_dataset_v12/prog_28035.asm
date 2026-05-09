; DESCRIPTION: Composite: Sets a single white pixel at (209, 161) then Places a red circle of radius 48 at center (176, 99).
; PLAN: r0=209(x), r1=161(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=99(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 161
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 176
LDI r6, 99
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

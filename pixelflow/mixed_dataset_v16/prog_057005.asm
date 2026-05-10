; DESCRIPTION: Composite: Sets a single white pixel at (261, 186) then Places a purple circle of radius 46 at center (280, 146).
; PLAN: r0=261(x), r1=186(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=146(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 186
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 280
LDI r6, 146
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

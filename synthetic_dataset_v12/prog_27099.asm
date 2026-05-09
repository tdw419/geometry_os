; DESCRIPTION: Composite: Sets a single white pixel at (500, 126) then Draws a cyan circle centered at (402, 135) with radius 59.
; PLAN: r0=500(x), r1=126(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=402(x), r6=135(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 500
LDI r1, 126
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 402
LDI r6, 135
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT

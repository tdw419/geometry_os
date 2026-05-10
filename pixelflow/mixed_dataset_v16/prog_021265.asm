; DESCRIPTION: Composite: Sets a single white pixel at (148, 154) then Places a yellow circle of radius 68 at center (295, 184).
; PLAN: r0=148(x), r1=154(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=184(y), r7=68(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 148
LDI r1, 154
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 295
LDI r6, 184
LDI r7, 68
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT

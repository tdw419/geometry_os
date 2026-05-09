; DESCRIPTION: Composite: Sets a single red pixel at (209, 188) then Creates a yellow circular shape at (287, 133) with radius 68.
; PLAN: r0=209(x), r1=188(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=133(y), r7=68(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 188
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 287
LDI r6, 133
LDI r7, 68
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Sets a single magenta pixel at (91, 192) then Draws a cyan circle centered at (133, 67) with radius 36.
; PLAN: r0=91(x), r1=192(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=67(y), r7=36(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 91
LDI r1, 192
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 133
LDI r6, 67
LDI r7, 36
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT

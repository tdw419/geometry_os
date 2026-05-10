; DESCRIPTION: Composite: Sets a single cyan pixel at (73, 153) then Draws a magenta circle centered at (271, 112) with radius 62.
; PLAN: r0=73(x), r1=153(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=271(x), r6=112(y), r7=62(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 73
LDI r1, 153
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 271
LDI r6, 112
LDI r7, 62
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Creates a red circular shape at (77, 74) with radius 37 then Renders a yellow box of size 66x101 starting at (404, 89) then Sets a single magenta pixel at (463, 82).
; PLAN: r0=77(x), r1=74(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x), r6=89(y), r7=66(width), r8=101(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=463(x), r11=82(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 77
LDI r1, 74
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 89
LDI r7, 66
LDI r8, 101
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 82
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

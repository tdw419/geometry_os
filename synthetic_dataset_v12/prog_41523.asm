; DESCRIPTION: Composite: Creates a red circular shape at (359, 143) with radius 73 then Places a green line segment connecting (204, 182) to (179, 108).
; PLAN: r0=359(x), r1=143(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x1), r6=182(y1), r7=179(x2), r8=108(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 143
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 182
LDI r7, 179
LDI r8, 108
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT

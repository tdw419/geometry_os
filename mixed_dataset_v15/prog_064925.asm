; DESCRIPTION: Composite: Draws a cyan circle centered at (436, 128) with radius 76 then Renders a red line between points (227, 126) and (205, 138).
; PLAN: r0=436(x), r1=128(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x1), r6=126(y1), r7=205(x2), r8=138(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 128
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 126
LDI r7, 205
LDI r8, 138
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Renders a green box of size 36x31 starting at (296, 179) then Renders a black disk with center (92, 96) and radius 75 then Places a red dot at position (153, 246).
; PLAN: r0=296(x), r1=179(y), r2=36(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x), r6=96(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=153(x), r11=246(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 296
LDI r1, 179
LDI r2, 36
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 96
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 153
LDI r11, 246
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT

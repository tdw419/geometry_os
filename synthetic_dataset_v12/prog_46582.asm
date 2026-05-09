; DESCRIPTION: Composite: Creates a green circular shape at (461, 99) with radius 30 then Places a green dot at position (347, 43) then Renders a cyan line between points (306, 7) and (168, 246).
; PLAN: r0=461(x), r1=99(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x), r6=43(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=306(x1), r11=7(y1), r12=168(x2), r13=246(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 99
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 43
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 306
LDI r11, 7
LDI r12, 168
LDI r13, 246
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT

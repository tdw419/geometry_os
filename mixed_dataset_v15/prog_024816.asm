; DESCRIPTION: Composite: Sets a single green pixel at (508, 34) then Places a yellow 58x100 rectangle at position (404, 115) then Renders a yellow disk with center (405, 183) and radius 38.
; PLAN: r0=508(x), r1=34(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=115(y), r7=58(width), r8=100(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=405(x), r11=183(y), r12=38(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 508
LDI r1, 34
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 404
LDI r6, 115
LDI r7, 58
LDI r8, 100
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 183
LDI r12, 38
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT

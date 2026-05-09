; DESCRIPTION: Composite: Sets a single yellow pixel at (507, 82) then Places a red 36x95 rectangle at position (404, 84) then Places a yellow circle of radius 80 at center (182, 104).
; PLAN: r0=507(x), r1=82(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=84(y), r7=36(width), r8=95(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=182(x), r11=104(y), r12=80(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 507
LDI r1, 82
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 404
LDI r6, 84
LDI r7, 36
LDI r8, 95
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 104
LDI r12, 80
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Sets a single red pixel at (41, 53) then Places a red 11x72 rectangle at position (470, 16) then Creates a green circular shape at (92, 133) with radius 53.
; PLAN: r0=41(x), r1=53(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=470(x), r6=16(y), r7=11(width), r8=72(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=92(x), r11=133(y), r12=53(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 41
LDI r1, 53
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 470
LDI r6, 16
LDI r7, 11
LDI r8, 72
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 133
LDI r12, 53
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Sets a single red pixel at (120, 200) then Places a cyan 50x41 rectangle at position (19, 12) then Creates a orange circular shape at (472, 81) with radius 32.
; PLAN: r0=120(x), r1=200(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=12(y), r7=50(width), r8=41(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=472(x), r11=81(y), r12=32(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 120
LDI r1, 200
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 19
LDI r6, 12
LDI r7, 50
LDI r8, 41
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 81
LDI r12, 32
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT

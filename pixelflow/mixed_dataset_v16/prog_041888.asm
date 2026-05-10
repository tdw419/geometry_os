; DESCRIPTION: Composite: Sets a single orange pixel at (308, 79) then Renders a cyan box of size 43x35 starting at (211, 105) then Places a red circle of radius 11 at center (354, 91).
; PLAN: r0=308(x), r1=79(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=105(y), r7=43(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=354(x), r11=91(y), r12=11(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 308
LDI r1, 79
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 211
LDI r6, 105
LDI r7, 43
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 91
LDI r12, 11
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT

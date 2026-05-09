; DESCRIPTION: Composite: Sets a single orange pixel at (98, 40) then Renders a purple box of size 109x103 starting at (137, 97) then Places a orange circle of radius 28 at center (202, 55).
; PLAN: r0=98(x), r1=40(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=97(y), r7=109(width), r8=103(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=202(x), r11=55(y), r12=28(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 98
LDI r1, 40
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 137
LDI r6, 97
LDI r7, 109
LDI r8, 103
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 55
LDI r12, 28
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT

; DESCRIPTION: Composite: Draws a green circle centered at (173, 211) with radius 41 then Sets a single red pixel at (365, 246) then Renders a black box of size 20x50 starting at (85, 173).
; PLAN: r0=173(x), r1=211(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=365(x), r6=246(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=85(x), r11=173(y), r12=20(width), r13=50(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 211
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 365
LDI r6, 246
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 85
LDI r11, 173
LDI r12, 20
LDI r13, 50
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT

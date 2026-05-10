; DESCRIPTION: Composite: Creates a orange circular shape at (306, 164) with radius 50 then Renders a purple box of size 15x21 starting at (137, 111).
; PLAN: r0=306(x), r1=164(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x), r6=111(y), r7=15(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 164
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 111
LDI r7, 15
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT

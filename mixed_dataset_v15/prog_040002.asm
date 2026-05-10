; DESCRIPTION: Composite: Renders a orange box of size 37x18 starting at (171, 137) then Sets a single orange pixel at (459, 45).
; PLAN: r0=171(x), r1=137(y), r2=37(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x), r6=45(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 171
LDI r1, 137
LDI r2, 37
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 45
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT

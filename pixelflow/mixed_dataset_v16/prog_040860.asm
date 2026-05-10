; DESCRIPTION: Composite: Places a orange 65x49 rectangle at position (391, 126) then Places a orange circle of radius 18 at center (365, 58).
; PLAN: r0=391(x), r1=126(y), r2=65(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=58(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 391
LDI r1, 126
LDI r2, 65
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 58
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

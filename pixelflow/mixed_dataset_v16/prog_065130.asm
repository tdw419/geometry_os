; DESCRIPTION: Composite: Places a orange 20x48 rectangle at position (303, 54) then Sets a single yellow pixel at (273, 72).
; PLAN: r0=303(x), r1=54(y), r2=20(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x), r6=72(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 303
LDI r1, 54
LDI r2, 20
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 72
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT

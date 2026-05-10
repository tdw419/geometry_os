; DESCRIPTION: Composite: Renders a blue box of size 38x10 starting at (241, 110) then Places a orange dot at position (115, 60).
; PLAN: r0=241(x), r1=110(y), r2=38(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x), r6=60(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 241
LDI r1, 110
LDI r2, 38
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 60
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT

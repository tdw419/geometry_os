; DESCRIPTION: Composite: Sets a single cyan pixel at (117, 232) then Renders a orange box of size 100x118 starting at (201, 48).
; PLAN: r0=117(x), r1=232(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=201(x), r6=48(y), r7=100(width), r8=118(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 232
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 201
LDI r6, 48
LDI r7, 100
LDI r8, 118
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT

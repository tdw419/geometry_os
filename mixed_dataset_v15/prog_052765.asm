; DESCRIPTION: Composite: Sets a single green pixel at (35, 9) then Places a green 88x99 rectangle at position (65, 9).
; PLAN: r0=35(x), r1=9(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=65(x), r6=9(y), r7=88(width), r8=99(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 35
LDI r1, 9
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 65
LDI r6, 9
LDI r7, 88
LDI r8, 99
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT

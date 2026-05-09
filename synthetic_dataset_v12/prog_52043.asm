; DESCRIPTION: Composite: Sets a single orange pixel at (302, 65) then Renders a black box of size 75x35 starting at (205, 145).
; PLAN: r0=302(x), r1=65(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=145(y), r7=75(width), r8=35(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 65
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 205
LDI r6, 145
LDI r7, 75
LDI r8, 35
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT

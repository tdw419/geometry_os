; DESCRIPTION: Composite: Renders a green box of size 70x76 starting at (97, 175) then Sets a single cyan pixel at (345, 149).
; PLAN: r0=97(x), r1=175(y), r2=70(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=149(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 175
LDI r2, 70
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 149
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Renders a orange box of size 57x98 starting at (311, 116) then Sets a single yellow pixel at (465, 17).
; PLAN: r0=311(x), r1=116(y), r2=57(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=17(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 116
LDI r2, 57
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 17
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT

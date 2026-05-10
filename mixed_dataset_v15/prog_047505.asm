; DESCRIPTION: Composite: Draws a magenta rectangle at (71, 5) with width 40 and height 108 then Sets a single yellow pixel at (465, 177).
; PLAN: r0=71(x), r1=5(y), r2=40(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=177(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 71
LDI r1, 5
LDI r2, 40
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 177
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT

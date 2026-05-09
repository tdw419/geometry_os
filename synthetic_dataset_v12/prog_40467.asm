; DESCRIPTION: Composite: Draws a white rectangle at (40, 77) with width 52 and height 114 then Sets a single cyan pixel at (337, 36).
; PLAN: r0=40(x), r1=77(y), r2=52(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=36(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 40
LDI r1, 77
LDI r2, 52
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 36
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

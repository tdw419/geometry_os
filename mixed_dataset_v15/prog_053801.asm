; DESCRIPTION: Composite: Renders a white box of size 74x46 starting at (61, 153) then Sets a single orange pixel at (175, 22).
; PLAN: r0=61(x), r1=153(y), r2=74(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x), r6=22(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 61
LDI r1, 153
LDI r2, 74
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 22
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Renders a red box of size 108x21 starting at (96, 21) then Sets a single white pixel at (157, 147).
; PLAN: r0=96(x), r1=21(y), r2=108(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=147(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 96
LDI r1, 21
LDI r2, 108
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 147
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Renders a red disk with center (399, 106) and radius 38 then Renders a white box of size 21x51 starting at (299, 96) then Sets a single yellow pixel at (511, 27).
; PLAN: r0=399(x), r1=106(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x), r6=96(y), r7=21(width), r8=51(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=511(x), r11=27(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 399
LDI r1, 106
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 96
LDI r7, 21
LDI r8, 51
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 511
LDI r11, 27
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

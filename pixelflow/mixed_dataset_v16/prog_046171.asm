; DESCRIPTION: Composite: Sets a single magenta pixel at (363, 44) then Renders a orange disk with center (110, 140) and radius 19 then Renders a cyan box of size 31x23 starting at (343, 96).
; PLAN: r0=363(x), r1=44(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=140(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=343(x), r11=96(y), r12=31(width), r13=23(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 44
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 110
LDI r6, 140
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 343
LDI r11, 96
LDI r12, 31
LDI r13, 23
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT

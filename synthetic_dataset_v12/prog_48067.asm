; DESCRIPTION: Composite: Creates a black rectangular region at (426, 28) spanning 18 by 31 pixels then Sets a single orange pixel at (66, 244) then Renders a cyan disk with center (231, 73) and radius 53.
; PLAN: r0=426(x), r1=28(y), r2=18(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=244(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=231(x), r11=73(y), r12=53(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 426
LDI r1, 28
LDI r2, 18
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 244
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 231
LDI r11, 73
LDI r12, 53
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT

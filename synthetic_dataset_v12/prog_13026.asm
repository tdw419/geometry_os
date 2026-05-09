; DESCRIPTION: Composite: Renders a orange disk with center (44, 90) and radius 22 then Creates a black rectangular region at (16, 61) spanning 103 by 33 pixels then Sets a single purple pixel at (235, 242).
; PLAN: r0=44(x), r1=90(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x), r6=61(y), r7=103(width), r8=33(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=235(x), r11=242(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 44
LDI r1, 90
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 61
LDI r7, 103
LDI r8, 33
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 235
LDI r11, 242
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT

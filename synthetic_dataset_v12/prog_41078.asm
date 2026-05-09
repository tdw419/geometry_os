; DESCRIPTION: Composite: Sets a single yellow pixel at (433, 244) then Renders a orange disk with center (235, 74) and radius 26 then Creates a magenta rectangular region at (115, 44) spanning 12 by 102 pixels.
; PLAN: r0=433(x), r1=244(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=74(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=115(x), r11=44(y), r12=12(width), r13=102(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 244
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 235
LDI r6, 74
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 115
LDI r11, 44
LDI r12, 12
LDI r13, 102
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT

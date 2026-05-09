; DESCRIPTION: Composite: Creates a blue rectangular region at (252, 65) spanning 87 by 82 pixels then Renders a yellow disk with center (438, 102) and radius 66 then Places a cyan dot at position (154, 51).
; PLAN: r0=252(x), r1=65(y), r2=87(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x), r6=102(y), r7=66(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=154(x), r11=51(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 252
LDI r1, 65
LDI r2, 87
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 102
LDI r7, 66
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 154
LDI r11, 51
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT

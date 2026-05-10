; DESCRIPTION: Composite: Places a yellow 87x13 rectangle at position (182, 186) then Renders a blue disk with center (438, 48) and radius 35 then Sets a single magenta pixel at (212, 239).
; PLAN: r0=182(x), r1=186(y), r2=87(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x), r6=48(y), r7=35(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=212(x), r11=239(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 182
LDI r1, 186
LDI r2, 87
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 48
LDI r7, 35
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 212
LDI r11, 239
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

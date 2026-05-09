; DESCRIPTION: Composite: Places a cyan line segment connecting (495, 184) to (23, 242) then Renders a blue disk with center (438, 129) and radius 28 then Places a orange dot at position (336, 122).
; PLAN: r0=495(x1), r1=184(y1), r2=23(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=129(y), r7=28(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=336(x), r11=122(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 495
LDI r1, 184
LDI r2, 23
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 129
LDI r7, 28
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 336
LDI r11, 122
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT

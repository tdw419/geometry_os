; DESCRIPTION: Composite: Renders a cyan disk with center (255, 169) and radius 77 then Renders a orange box of size 70x10 starting at (227, 104) then Sets a single magenta pixel at (421, 126).
; PLAN: r0=255(x), r1=169(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x), r6=104(y), r7=70(width), r8=10(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=421(x), r11=126(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 255
LDI r1, 169
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 104
LDI r7, 70
LDI r8, 10
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 126
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

; DESCRIPTION: Composite: Places a black 101x52 rectangle at position (395, 62) then Sets a single white pixel at (108, 169) then Places a cyan circle of radius 52 at center (223, 83).
; PLAN: r0=395(x), r1=62(y), r2=101(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=169(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=223(x), r11=83(y), r12=52(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 395
LDI r1, 62
LDI r2, 101
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 169
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 223
LDI r11, 83
LDI r12, 52
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT

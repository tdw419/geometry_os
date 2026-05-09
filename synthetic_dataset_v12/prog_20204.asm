; DESCRIPTION: Composite: Places a cyan circle of radius 77 at center (308, 158) then Renders a yellow box of size 10x63 starting at (131, 72) then Sets a single white pixel at (149, 136).
; PLAN: r0=308(x), r1=158(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x), r6=72(y), r7=10(width), r8=63(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=149(x), r11=136(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 308
LDI r1, 158
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 72
LDI r7, 10
LDI r8, 63
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 136
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT

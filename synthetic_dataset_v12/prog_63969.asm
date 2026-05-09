; DESCRIPTION: Composite: Renders a yellow box of size 95x13 starting at (17, 14) then Renders a green line between points (83, 18) and (312, 0) then Sets a single green pixel at (102, 213).
; PLAN: r0=17(x), r1=14(y), r2=95(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x1), r6=18(y1), r7=312(x2), r8=0(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=102(x), r11=213(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 17
LDI r1, 14
LDI r2, 95
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 18
LDI r7, 312
LDI r8, 0
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 213
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT

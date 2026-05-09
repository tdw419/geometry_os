; DESCRIPTION: Composite: Creates a cyan circular shape at (331, 121) with radius 20 then Places a yellow line segment connecting (481, 203) to (138, 45).
; PLAN: r0=331(x), r1=121(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x1), r6=203(y1), r7=138(x2), r8=45(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 121
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 203
LDI r7, 138
LDI r8, 45
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

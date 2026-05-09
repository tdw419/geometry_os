; DESCRIPTION: Composite: Places a green line segment connecting (21, 40) to (465, 242) then Creates a cyan circular shape at (241, 78) with radius 49.
; PLAN: r0=21(x1), r1=40(y1), r2=465(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=78(y), r7=49(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 40
LDI r2, 465
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 78
LDI r7, 49
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT

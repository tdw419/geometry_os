; DESCRIPTION: Composite: Places a yellow line segment connecting (398, 64) to (165, 184) then Creates a cyan circular shape at (155, 135) with radius 55.
; PLAN: r0=398(x1), r1=64(y1), r2=165(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=155(x), r6=135(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 398
LDI r1, 64
LDI r2, 165
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 135
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT

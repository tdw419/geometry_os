; DESCRIPTION: Composite: Creates a cyan circular shape at (326, 192) with radius 21 then Places a orange line segment connecting (80, 21) to (94, 45).
; PLAN: r0=326(x), r1=192(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x1), r6=21(y1), r7=94(x2), r8=45(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 192
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 21
LDI r7, 94
LDI r8, 45
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

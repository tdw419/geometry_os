; DESCRIPTION: Composite: Places a green line segment connecting (38, 30) to (459, 13) then Places a cyan circle of radius 23 at center (176, 38).
; PLAN: r0=38(x1), r1=30(y1), r2=459(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=38(y), r7=23(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 38
LDI r1, 30
LDI r2, 459
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 38
LDI r7, 23
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT

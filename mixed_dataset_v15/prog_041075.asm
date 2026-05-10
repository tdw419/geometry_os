; DESCRIPTION: Composite: Places a yellow line segment connecting (348, 56) to (172, 141) then Places a cyan 64x45 rectangle at position (86, 108).
; PLAN: r0=348(x1), r1=56(y1), r2=172(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=108(y), r7=64(width), r8=45(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 56
LDI r2, 172
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 108
LDI r7, 64
LDI r8, 45
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

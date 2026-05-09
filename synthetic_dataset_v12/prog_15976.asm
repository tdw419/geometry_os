; DESCRIPTION: Composite: Places a magenta 12x89 rectangle at position (254, 134) then Places a purple line segment connecting (128, 108) to (377, 192).
; PLAN: r0=254(x), r1=134(y), r2=12(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x1), r6=108(y1), r7=377(x2), r8=192(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 134
LDI r2, 12
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 108
LDI r7, 377
LDI r8, 192
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Places a cyan line segment connecting (351, 249) to (283, 212) then Places a orange 76x11 rectangle at position (332, 31).
; PLAN: r0=351(x1), r1=249(y1), r2=283(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=31(y), r7=76(width), r8=11(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 249
LDI r2, 283
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 31
LDI r7, 76
LDI r8, 11
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT

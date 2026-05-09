; DESCRIPTION: Composite: Places a yellow 82x58 rectangle at position (38, 191) then Places a yellow line segment connecting (381, 12) to (471, 86).
; PLAN: r0=38(x), r1=191(y), r2=82(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x1), r6=12(y1), r7=471(x2), r8=86(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 38
LDI r1, 191
LDI r2, 82
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 12
LDI r7, 471
LDI r8, 86
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

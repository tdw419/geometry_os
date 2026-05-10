; DESCRIPTION: Composite: Draws a yellow line from (98, 105) to (199, 191) then Places a orange 82x99 rectangle at position (58, 65).
; PLAN: r0=98(x1), r1=105(y1), r2=199(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=58(x), r6=65(y), r7=82(width), r8=99(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 105
LDI r2, 199
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 65
LDI r7, 82
LDI r8, 99
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Places a green 28x20 rectangle at position (441, 191) then Places a orange line segment connecting (296, 179) to (284, 149).
; PLAN: r0=441(x), r1=191(y), r2=28(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=296(x1), r6=179(y1), r7=284(x2), r8=149(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 191
LDI r2, 28
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 179
LDI r7, 284
LDI r8, 149
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

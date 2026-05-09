; DESCRIPTION: Composite: Draws a green line from (452, 126) to (338, 248) then Places a white 21x70 rectangle at position (8, 106).
; PLAN: r0=452(x1), r1=126(y1), r2=338(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=8(x), r6=106(y), r7=21(width), r8=70(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 452
LDI r1, 126
LDI r2, 338
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 8
LDI r6, 106
LDI r7, 21
LDI r8, 70
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Places a white line segment connecting (115, 179) to (159, 8) then Places a yellow 105x46 rectangle at position (176, 206).
; PLAN: r0=115(x1), r1=179(y1), r2=159(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=206(y), r7=105(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 179
LDI r2, 159
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 206
LDI r7, 105
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT

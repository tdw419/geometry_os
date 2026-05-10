; DESCRIPTION: Composite: Draws a white rectangle at (343, 8) with width 58 and height 81 then Places a cyan line segment connecting (263, 160) to (99, 244).
; PLAN: r0=343(x), r1=8(y), r2=58(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x1), r6=160(y1), r7=99(x2), r8=244(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 8
LDI r2, 58
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 160
LDI r7, 99
LDI r8, 244
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

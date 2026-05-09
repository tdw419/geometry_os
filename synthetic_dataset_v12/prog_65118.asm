; DESCRIPTION: Composite: Draws a black line from (417, 72) to (308, 89) then Draws a magenta rectangle at (443, 75) with width 63 and height 89.
; PLAN: r0=417(x1), r1=72(y1), r2=308(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=75(y), r7=63(width), r8=89(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 72
LDI r2, 308
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 75
LDI r7, 63
LDI r8, 89
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT

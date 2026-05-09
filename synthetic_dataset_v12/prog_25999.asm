; DESCRIPTION: Composite: Places a purple 10x11 rectangle at position (371, 176) then Renders a orange line between points (260, 251) and (287, 95).
; PLAN: r0=371(x), r1=176(y), r2=10(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x1), r6=251(y1), r7=287(x2), r8=95(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 176
LDI r2, 10
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 251
LDI r7, 287
LDI r8, 95
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

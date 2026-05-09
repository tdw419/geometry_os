; DESCRIPTION: Composite: Draws a black line from (308, 193) to (45, 169) then Renders a blue box of size 76x50 starting at (195, 84).
; PLAN: r0=308(x1), r1=193(y1), r2=45(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=84(y), r7=76(width), r8=50(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 193
LDI r2, 45
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 84
LDI r7, 76
LDI r8, 50
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

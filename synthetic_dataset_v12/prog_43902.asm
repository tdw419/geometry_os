; DESCRIPTION: Composite: Draws a purple line from (141, 80) to (206, 185) then Places a black 99x52 rectangle at position (107, 194).
; PLAN: r0=141(x1), r1=80(y1), r2=206(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=194(y), r7=99(width), r8=52(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 80
LDI r2, 206
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 194
LDI r7, 99
LDI r8, 52
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT

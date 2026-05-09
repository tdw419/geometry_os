; DESCRIPTION: Composite: Renders a purple box of size 56x89 starting at (18, 145) then Places a purple line segment connecting (439, 133) to (444, 138).
; PLAN: r0=18(x), r1=145(y), r2=56(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x1), r6=133(y1), r7=444(x2), r8=138(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 18
LDI r1, 145
LDI r2, 56
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 133
LDI r7, 444
LDI r8, 138
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

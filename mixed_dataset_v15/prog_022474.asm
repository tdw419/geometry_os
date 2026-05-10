; DESCRIPTION: Composite: Renders a magenta box of size 107x106 starting at (4, 145) then Renders a black line between points (422, 55) and (70, 131).
; PLAN: r0=4(x), r1=145(y), r2=107(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x1), r6=55(y1), r7=70(x2), r8=131(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 145
LDI r2, 107
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 55
LDI r7, 70
LDI r8, 131
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Draws a purple rectangle at (229, 157) with width 59 and height 35 then Places a black line segment connecting (208, 89) to (401, 51).
; PLAN: r0=229(x), r1=157(y), r2=59(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x1), r6=89(y1), r7=401(x2), r8=51(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 157
LDI r2, 59
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 89
LDI r7, 401
LDI r8, 51
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT

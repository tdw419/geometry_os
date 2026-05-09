; DESCRIPTION: Composite: Draws a black line from (229, 120) to (133, 49) then Renders a green box of size 89x78 starting at (271, 107).
; PLAN: r0=229(x1), r1=120(y1), r2=133(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=107(y), r7=89(width), r8=78(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 120
LDI r2, 133
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 107
LDI r7, 89
LDI r8, 78
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Renders a green box of size 104x39 starting at (219, 154) then Renders a red line between points (490, 71) and (270, 238).
; PLAN: r0=219(x), r1=154(y), r2=104(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x1), r6=71(y1), r7=270(x2), r8=238(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 154
LDI r2, 104
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 71
LDI r7, 270
LDI r8, 238
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Renders a yellow line between points (471, 75) and (287, 236) then Renders a cyan box of size 57x118 starting at (112, 93).
; PLAN: r0=471(x1), r1=75(y1), r2=287(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=93(y), r7=57(width), r8=118(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 75
LDI r2, 287
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 93
LDI r7, 57
LDI r8, 118
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Places a black 110x20 rectangle at position (391, 180) then Renders a white line between points (158, 165) and (68, 192).
; PLAN: r0=391(x), r1=180(y), r2=110(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x1), r6=165(y1), r7=68(x2), r8=192(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 180
LDI r2, 110
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 165
LDI r7, 68
LDI r8, 192
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT

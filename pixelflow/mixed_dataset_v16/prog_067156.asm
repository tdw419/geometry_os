; DESCRIPTION: Composite: Places a white line segment connecting (295, 74) to (29, 106) then Renders a red disk with center (311, 157) and radius 54.
; PLAN: r0=295(x1), r1=74(y1), r2=29(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=157(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 295
LDI r1, 74
LDI r2, 29
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 157
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

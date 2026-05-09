; DESCRIPTION: Composite: Renders a cyan disk with center (222, 54) and radius 29 then Places a red line segment connecting (490, 168) to (120, 191).
; PLAN: r0=222(x), r1=54(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x1), r6=168(y1), r7=120(x2), r8=191(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 54
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 168
LDI r7, 120
LDI r8, 191
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

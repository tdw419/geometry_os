; DESCRIPTION: Composite: Places a white circle of radius 54 at center (373, 117) then Renders a red line between points (85, 60) and (495, 205).
; PLAN: r0=373(x), r1=117(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x1), r6=60(y1), r7=495(x2), r8=205(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 117
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 60
LDI r7, 495
LDI r8, 205
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

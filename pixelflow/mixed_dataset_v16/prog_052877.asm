; DESCRIPTION: Composite: Places a black circle of radius 54 at center (104, 101) then Renders a cyan line between points (47, 20) and (150, 132).
; PLAN: r0=104(x), r1=101(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x1), r6=20(y1), r7=150(x2), r8=132(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 101
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 20
LDI r7, 150
LDI r8, 132
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

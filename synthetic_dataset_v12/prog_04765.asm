; DESCRIPTION: Composite: Places a red circle of radius 31 at center (439, 118) then Places a cyan line segment connecting (437, 146) to (219, 147).
; PLAN: r0=439(x), r1=118(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x1), r6=146(y1), r7=219(x2), r8=147(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 118
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 146
LDI r7, 219
LDI r8, 147
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Sets a single red pixel at (147, 222) then Renders a white box of size 118x110 starting at (63, 54).
; PLAN: r0=147(x), r1=222(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=54(y), r7=118(width), r8=110(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 222
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 63
LDI r6, 54
LDI r7, 118
LDI r8, 110
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT

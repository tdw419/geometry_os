; DESCRIPTION: Composite: Places a green line segment connecting (35, 147) to (119, 251) then Creates a cyan rectangular region at (397, 144) spanning 52 by 95 pixels.
; PLAN: r0=35(x1), r1=147(y1), r2=119(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=144(y), r7=52(width), r8=95(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 35
LDI r1, 147
LDI r2, 119
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 144
LDI r7, 52
LDI r8, 95
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

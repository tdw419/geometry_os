; DESCRIPTION: Composite: Creates a black circular shape at (320, 143) with radius 57 then Renders a green line between points (74, 170) and (439, 152).
; PLAN: r0=320(x), r1=143(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x1), r6=170(y1), r7=439(x2), r8=152(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 143
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 170
LDI r7, 439
LDI r8, 152
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Renders a white line between points (364, 137) and (11, 54) then Renders a blue box of size 91x82 starting at (308, 157).
; PLAN: r0=364(x1), r1=137(y1), r2=11(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=157(y), r7=91(width), r8=82(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 137
LDI r2, 11
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 157
LDI r7, 91
LDI r8, 82
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

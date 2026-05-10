; DESCRIPTION: Composite: Renders a magenta box of size 13x64 starting at (278, 13) then Renders a white line between points (459, 83) and (119, 244).
; PLAN: r0=278(x), r1=13(y), r2=13(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x1), r6=83(y1), r7=119(x2), r8=244(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 13
LDI r2, 13
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 83
LDI r7, 119
LDI r8, 244
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT

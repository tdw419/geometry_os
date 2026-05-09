; DESCRIPTION: Composite: Creates a cyan circular shape at (402, 58) with radius 47 then Draws a purple line from (491, 6) to (135, 4).
; PLAN: r0=402(x), r1=58(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=491(x1), r6=6(y1), r7=135(x2), r8=4(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 58
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 491
LDI r6, 6
LDI r7, 135
LDI r8, 4
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

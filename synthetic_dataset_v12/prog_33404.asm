; DESCRIPTION: Composite: Places a cyan line segment connecting (165, 83) to (478, 87) then Renders a black box of size 63x111 starting at (129, 34).
; PLAN: r0=165(x1), r1=83(y1), r2=478(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=34(y), r7=63(width), r8=111(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 83
LDI r2, 478
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 34
LDI r7, 63
LDI r8, 111
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT

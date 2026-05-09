; DESCRIPTION: Composite: Renders a green line between points (453, 90) and (218, 3) then Renders a red box of size 104x119 starting at (297, 17).
; PLAN: r0=453(x1), r1=90(y1), r2=218(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=17(y), r7=104(width), r8=119(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 90
LDI r2, 218
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 17
LDI r7, 104
LDI r8, 119
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Draws a green line from (94, 142) to (335, 12) then Creates a black rectangular region at (407, 111) spanning 48 by 115 pixels.
; PLAN: r0=94(x1), r1=142(y1), r2=335(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=407(x), r6=111(y), r7=48(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 142
LDI r2, 335
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 111
LDI r7, 48
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT

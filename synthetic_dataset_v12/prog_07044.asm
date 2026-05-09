; DESCRIPTION: Composite: Creates a black rectangular region at (243, 201) spanning 11 by 32 pixels then Places a cyan line segment connecting (136, 139) to (443, 217).
; PLAN: r0=243(x), r1=201(y), r2=11(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x1), r6=139(y1), r7=443(x2), r8=217(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 201
LDI r2, 11
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 139
LDI r7, 443
LDI r8, 217
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

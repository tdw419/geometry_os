; DESCRIPTION: Composite: Renders a cyan line between points (172, 48) and (274, 105) then Creates a yellow rectangular region at (307, 69) spanning 104 by 77 pixels.
; PLAN: r0=172(x1), r1=48(y1), r2=274(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=69(y), r7=104(width), r8=77(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 48
LDI r2, 274
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 69
LDI r7, 104
LDI r8, 77
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT

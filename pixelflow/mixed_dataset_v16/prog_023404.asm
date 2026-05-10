; DESCRIPTION: Composite: Places a black line segment connecting (499, 213) to (264, 43) then Creates a cyan rectangular region at (99, 179) spanning 92 by 26 pixels.
; PLAN: r0=499(x1), r1=213(y1), r2=264(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=99(x), r6=179(y), r7=92(width), r8=26(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 499
LDI r1, 213
LDI r2, 264
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 179
LDI r7, 92
LDI r8, 26
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Creates a purple rectangular region at (173, 115) spanning 54 by 97 pixels then Places a yellow line segment connecting (298, 102) to (248, 12).
; PLAN: r0=173(x), r1=115(y), r2=54(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x1), r6=102(y1), r7=248(x2), r8=12(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 115
LDI r2, 54
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 102
LDI r7, 248
LDI r8, 12
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

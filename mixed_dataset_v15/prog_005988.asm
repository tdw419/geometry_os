; DESCRIPTION: Composite: Places a purple line segment connecting (322, 230) to (91, 54) then Creates a cyan rectangular region at (364, 103) spanning 63 by 34 pixels.
; PLAN: r0=322(x1), r1=230(y1), r2=91(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=103(y), r7=63(width), r8=34(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 230
LDI r2, 91
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 103
LDI r7, 63
LDI r8, 34
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

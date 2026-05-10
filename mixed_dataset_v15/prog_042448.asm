; DESCRIPTION: Composite: Draws a red line from (508, 123) to (482, 49) then Creates a cyan rectangular region at (134, 114) spanning 59 by 81 pixels.
; PLAN: r0=508(x1), r1=123(y1), r2=482(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=114(y), r7=59(width), r8=81(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 508
LDI r1, 123
LDI r2, 482
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 114
LDI r7, 59
LDI r8, 81
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Places a black circle of radius 70 at center (439, 170) then Creates a cyan rectangular region at (7, 184) spanning 77 by 50 pixels then Draws a purple line from (62, 10) to (295, 243).
; PLAN: r0=439(x), r1=170(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x), r6=184(y), r7=77(width), r8=50(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=62(x1), r11=10(y1), r12=295(x2), r13=243(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 170
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 184
LDI r7, 77
LDI r8, 50
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 10
LDI r12, 295
LDI r13, 243
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT

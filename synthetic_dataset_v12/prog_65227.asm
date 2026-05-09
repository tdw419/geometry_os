; DESCRIPTION: Composite: Draws a black line from (286, 116) to (185, 216) then Creates a cyan rectangular region at (398, 78) spanning 99 by 117 pixels.
; PLAN: r0=286(x1), r1=116(y1), r2=185(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=78(y), r7=99(width), r8=117(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 116
LDI r2, 185
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 78
LDI r7, 99
LDI r8, 117
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

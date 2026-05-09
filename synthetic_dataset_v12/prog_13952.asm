; DESCRIPTION: Composite: Draws a green line from (191, 217) to (76, 249) then Creates a red rectangular region at (407, 180) spanning 98 by 62 pixels.
; PLAN: r0=191(x1), r1=217(y1), r2=76(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=407(x), r6=180(y), r7=98(width), r8=62(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 217
LDI r2, 76
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 180
LDI r7, 98
LDI r8, 62
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT

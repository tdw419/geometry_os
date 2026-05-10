; DESCRIPTION: Composite: Draws a green line from (331, 234) to (463, 113) then Creates a cyan rectangular region at (105, 157) spanning 73 by 97 pixels.
; PLAN: r0=331(x1), r1=234(y1), r2=463(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=157(y), r7=73(width), r8=97(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 234
LDI r2, 463
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 157
LDI r7, 73
LDI r8, 97
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

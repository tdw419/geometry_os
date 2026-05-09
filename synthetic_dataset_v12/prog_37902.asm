; DESCRIPTION: Composite: Draws a blue line from (84, 207) to (201, 193) then Creates a cyan rectangular region at (395, 164) spanning 97 by 74 pixels.
; PLAN: r0=84(x1), r1=207(y1), r2=201(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=164(y), r7=97(width), r8=74(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 207
LDI r2, 201
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 164
LDI r7, 97
LDI r8, 74
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

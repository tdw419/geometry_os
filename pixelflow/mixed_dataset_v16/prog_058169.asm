; DESCRIPTION: Composite: Places a green line segment connecting (209, 254) to (234, 155) then Creates a cyan rectangular region at (230, 127) spanning 68 by 17 pixels.
; PLAN: r0=209(x1), r1=254(y1), r2=234(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=127(y), r7=68(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 254
LDI r2, 234
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 127
LDI r7, 68
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

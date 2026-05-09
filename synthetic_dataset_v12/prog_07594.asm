; DESCRIPTION: Composite: Draws a green line from (258, 70) to (116, 197) then Creates a orange circular shape at (440, 47) with radius 13.
; PLAN: r0=258(x1), r1=70(y1), r2=116(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=47(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 258
LDI r1, 70
LDI r2, 116
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 47
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

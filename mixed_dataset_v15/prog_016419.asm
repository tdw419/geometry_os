; DESCRIPTION: Composite: Draws a purple circle centered at (436, 128) with radius 65 then Draws a purple line from (398, 18) to (117, 208).
; PLAN: r0=436(x), r1=128(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x1), r6=18(y1), r7=117(x2), r8=208(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 128
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 18
LDI r7, 117
LDI r8, 208
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

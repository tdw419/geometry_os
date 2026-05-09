; DESCRIPTION: Composite: Places a yellow 97x11 rectangle at position (357, 28) then Draws a green line from (314, 160) to (412, 80).
; PLAN: r0=357(x), r1=28(y), r2=97(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x1), r6=160(y1), r7=412(x2), r8=80(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 28
LDI r2, 97
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 160
LDI r7, 412
LDI r8, 80
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT

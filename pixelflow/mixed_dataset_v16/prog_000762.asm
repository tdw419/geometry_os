; DESCRIPTION: Composite: Places a yellow 119x33 rectangle at position (122, 214) then Draws a black line from (97, 230) to (376, 66).
; PLAN: r0=122(x), r1=214(y), r2=119(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x1), r6=230(y1), r7=376(x2), r8=66(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 122
LDI r1, 214
LDI r2, 119
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 230
LDI r7, 376
LDI r8, 66
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT

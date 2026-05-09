; DESCRIPTION: Composite: Draws a white line from (129, 207) to (342, 149) then Renders a blue box of size 83x58 starting at (102, 115).
; PLAN: r0=129(x1), r1=207(y1), r2=342(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=115(y), r7=83(width), r8=58(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 207
LDI r2, 342
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 115
LDI r7, 83
LDI r8, 58
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

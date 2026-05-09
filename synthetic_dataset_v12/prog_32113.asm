; DESCRIPTION: Composite: Places a orange 73x68 rectangle at position (105, 148) then Draws a purple line from (192, 38) to (475, 210).
; PLAN: r0=105(x), r1=148(y), r2=73(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x1), r6=38(y1), r7=475(x2), r8=210(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 148
LDI r2, 73
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 38
LDI r7, 475
LDI r8, 210
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

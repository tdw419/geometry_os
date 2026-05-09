; DESCRIPTION: Composite: Draws a yellow rectangle at (411, 33) with width 39 and height 102 then Draws a blue line from (409, 57) to (123, 76).
; PLAN: r0=411(x), r1=33(y), r2=39(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x1), r6=57(y1), r7=123(x2), r8=76(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 33
LDI r2, 39
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 57
LDI r7, 123
LDI r8, 76
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT

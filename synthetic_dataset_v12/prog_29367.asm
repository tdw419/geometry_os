; DESCRIPTION: Composite: Draws a blue line from (182, 247) to (478, 3) then Draws a yellow rectangle at (152, 96) with width 20 and height 119.
; PLAN: r0=182(x1), r1=247(y1), r2=478(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=96(y), r7=20(width), r8=119(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 247
LDI r2, 478
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 96
LDI r7, 20
LDI r8, 119
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT

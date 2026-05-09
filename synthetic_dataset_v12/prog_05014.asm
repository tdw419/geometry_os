; DESCRIPTION: Composite: Draws a blue line from (453, 184) to (303, 231) then Creates a red rectangular region at (230, 134) spanning 95 by 67 pixels.
; PLAN: r0=453(x1), r1=184(y1), r2=303(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=134(y), r7=95(width), r8=67(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 184
LDI r2, 303
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 134
LDI r7, 95
LDI r8, 67
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT

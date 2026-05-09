; DESCRIPTION: Composite: Places a red line segment connecting (355, 237) to (153, 121) then Renders a yellow box of size 113x22 starting at (301, 25).
; PLAN: r0=355(x1), r1=237(y1), r2=153(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=25(y), r7=113(width), r8=22(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 237
LDI r2, 153
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 25
LDI r7, 113
LDI r8, 22
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT

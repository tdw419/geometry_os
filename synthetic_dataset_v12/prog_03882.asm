; DESCRIPTION: Composite: Draws a blue line from (150, 0) to (405, 168) then Renders a blue box of size 57x60 starting at (171, 118) then Renders a red disk with center (99, 198) and radius 22.
; PLAN: r0=150(x1), r1=0(y1), r2=405(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=118(y), r7=57(width), r8=60(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x), r11=198(y), r12=22(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 150
LDI r1, 0
LDI r2, 405
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 118
LDI r7, 57
LDI r8, 60
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 198
LDI r12, 22
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT

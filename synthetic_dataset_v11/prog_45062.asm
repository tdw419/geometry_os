; DESCRIPTION: Composite: . Then Places a red line segment connecting (222, 18) to (153, 169). Then Renders a white box of size 37x109 starting at (146, 101).
; PLAN: r0=222(x1), r1=18(y1), r2=153(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=146(x), r1=101(y), r2=37(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red line segment connecting (222, 18) to (153, 169).
; PLAN: r0=222(x1), r1=18(y1), r2=153(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 18
LDI r2, 153
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white box of size 37x109 starting at (146, 101).
; PLAN: r0=146(x), r1=101(y), r2=37(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 101
LDI r2, 37
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

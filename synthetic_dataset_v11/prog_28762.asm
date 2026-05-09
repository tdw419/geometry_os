; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (175, 52) spanning 62 by 55 pixels. Then Places a blue line segment connecting (158, 155) to (128, 187).
; PLAN: r0=175(x), r1=52(y), r2=62(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=158(x1), r1=155(y1), r2=128(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue rectangular region at (175, 52) spanning 62 by 55 pixels.
; PLAN: r0=175(x), r1=52(y), r2=62(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 52
LDI r2, 62
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue line segment connecting (158, 155) to (128, 187).
; PLAN: r0=158(x1), r1=155(y1), r2=128(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 155
LDI r2, 128
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

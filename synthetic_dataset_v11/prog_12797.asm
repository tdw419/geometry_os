; DESCRIPTION: Composite: . Then Renders a purple line between points (215, 33) and (122, 1). Then Creates a green rectangular region at (133, 95) spanning 35 by 23 pixels.
; PLAN: r0=215(x1), r1=33(y1), r2=122(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=133(x), r1=95(y), r2=35(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (215, 33) and (122, 1).
; PLAN: r0=215(x1), r1=33(y1), r2=122(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 33
LDI r2, 122
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green rectangular region at (133, 95) spanning 35 by 23 pixels.
; PLAN: r0=133(x), r1=95(y), r2=35(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 95
LDI r2, 35
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

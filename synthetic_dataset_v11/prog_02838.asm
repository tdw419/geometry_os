; DESCRIPTION: Composite: . Then Creates a black rectangular region at (17, 27) spanning 48 by 101 pixels. Then Draws a purple line from (185, 58) to (222, 0).
; PLAN: r0=17(x), r1=27(y), r2=48(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=185(x1), r1=58(y1), r2=222(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black rectangular region at (17, 27) spanning 48 by 101 pixels.
; PLAN: r0=17(x), r1=27(y), r2=48(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 27
LDI r2, 48
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (185, 58) to (222, 0).
; PLAN: r0=185(x1), r1=58(y1), r2=222(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 58
LDI r2, 222
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

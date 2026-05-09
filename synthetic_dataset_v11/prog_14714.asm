; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (111, 194) spanning 17 by 47 pixels. Then Places a black line segment connecting (95, 100) to (222, 249).
; PLAN: r0=111(x), r1=194(y), r2=17(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=95(x1), r1=100(y1), r2=222(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple rectangular region at (111, 194) spanning 17 by 47 pixels.
; PLAN: r0=111(x), r1=194(y), r2=17(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 194
LDI r2, 17
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black line segment connecting (95, 100) to (222, 249).
; PLAN: r0=95(x1), r1=100(y1), r2=222(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 100
LDI r2, 222
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

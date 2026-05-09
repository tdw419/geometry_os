; DESCRIPTION: Composite: . Then Places a purple 39x80 rectangle at position (136, 169). Then Places a red line segment connecting (118, 219) to (22, 111).
; PLAN: r0=136(x), r1=169(y), r2=39(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=118(x1), r1=219(y1), r2=22(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple 39x80 rectangle at position (136, 169).
; PLAN: r0=136(x), r1=169(y), r2=39(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 169
LDI r2, 39
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (118, 219) to (22, 111).
; PLAN: r0=118(x1), r1=219(y1), r2=22(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 219
LDI r2, 22
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

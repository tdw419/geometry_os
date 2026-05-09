; DESCRIPTION: Composite: . Then Places a purple 77x56 rectangle at position (133, 21). Then Places a red circle of radius 38 at center (185, 153).
; PLAN: r0=133(x), r1=21(y), r2=77(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=185(x), r1=153(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple 77x56 rectangle at position (133, 21).
; PLAN: r0=133(x), r1=21(y), r2=77(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 21
LDI r2, 77
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 38 at center (185, 153).
; PLAN: r0=185(x), r1=153(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 153
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

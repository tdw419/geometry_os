; DESCRIPTION: Composite: . Then Creates a red rectangular region at (222, 151) spanning 16 by 22 pixels. Then Places a blue line segment connecting (129, 196) to (30, 178).
; PLAN: r0=222(x), r1=151(y), r2=16(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=129(x1), r1=196(y1), r2=30(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red rectangular region at (222, 151) spanning 16 by 22 pixels.
; PLAN: r0=222(x), r1=151(y), r2=16(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 151
LDI r2, 16
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue line segment connecting (129, 196) to (30, 178).
; PLAN: r0=129(x1), r1=196(y1), r2=30(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 196
LDI r2, 30
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

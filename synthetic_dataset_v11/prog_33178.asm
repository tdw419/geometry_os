; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (205, 58) spanning 14 by 48 pixels. Then Places a purple line segment connecting (176, 175) to (195, 180).
; PLAN: r0=205(x), r1=58(y), r2=14(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=176(x1), r1=175(y1), r2=195(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta rectangular region at (205, 58) spanning 14 by 48 pixels.
; PLAN: r0=205(x), r1=58(y), r2=14(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 58
LDI r2, 14
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (176, 175) to (195, 180).
; PLAN: r0=176(x1), r1=175(y1), r2=195(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 175
LDI r2, 195
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

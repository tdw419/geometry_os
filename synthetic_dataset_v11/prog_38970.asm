; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (111, 154) to (173, 206). Then Creates a yellow rectangular region at (192, 155) spanning 52 by 88 pixels.
; PLAN: r0=111(x1), r1=154(y1), r2=173(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=192(x), r1=155(y), r2=52(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (111, 154) to (173, 206).
; PLAN: r0=111(x1), r1=154(y1), r2=173(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 154
LDI r2, 173
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (192, 155) spanning 52 by 88 pixels.
; PLAN: r0=192(x), r1=155(y), r2=52(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 155
LDI r2, 52
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (102, 120) spanning 44 by 101 pixels. Then Draws a green line from (13, 178) to (163, 67).
; PLAN: r0=102(x), r1=120(y), r2=44(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=13(x1), r1=178(y1), r2=163(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow rectangular region at (102, 120) spanning 44 by 101 pixels.
; PLAN: r0=102(x), r1=120(y), r2=44(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 120
LDI r2, 44
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (13, 178) to (163, 67).
; PLAN: r0=13(x1), r1=178(y1), r2=163(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 178
LDI r2, 163
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

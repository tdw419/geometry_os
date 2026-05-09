; DESCRIPTION: Composite: . Then Renders a purple line between points (114, 218) and (58, 204). Then Creates a yellow rectangular region at (215, 61) spanning 24 by 118 pixels.
; PLAN: r0=114(x1), r1=218(y1), r2=58(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=215(x), r1=61(y), r2=24(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (114, 218) and (58, 204).
; PLAN: r0=114(x1), r1=218(y1), r2=58(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 218
LDI r2, 58
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (215, 61) spanning 24 by 118 pixels.
; PLAN: r0=215(x), r1=61(y), r2=24(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 61
LDI r2, 24
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (144, 101) spanning 10 by 79 pixels. Then Renders a white line between points (67, 23) and (175, 217).
; PLAN: r0=144(x), r1=101(y), r2=10(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=67(x1), r1=23(y1), r2=175(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue rectangular region at (144, 101) spanning 10 by 79 pixels.
; PLAN: r0=144(x), r1=101(y), r2=10(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 101
LDI r2, 10
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (67, 23) and (175, 217).
; PLAN: r0=67(x1), r1=23(y1), r2=175(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 23
LDI r2, 175
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Places a purple line segment connecting (222, 197) to (172, 92). Then Creates a blue rectangular region at (174, 7) spanning 74 by 13 pixels.
; PLAN: r0=222(x1), r1=197(y1), r2=172(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=174(x), r1=7(y), r2=74(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (222, 197) to (172, 92).
; PLAN: r0=222(x1), r1=197(y1), r2=172(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 197
LDI r2, 172
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue rectangular region at (174, 7) spanning 74 by 13 pixels.
; PLAN: r0=174(x), r1=7(y), r2=74(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 7
LDI r2, 74
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

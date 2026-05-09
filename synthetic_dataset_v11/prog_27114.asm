; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (137, 131) spanning 49 by 46 pixels. Then Draws a blue line from (47, 191) to (25, 208).
; PLAN: r0=137(x), r1=131(y), r2=49(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=47(x1), r1=191(y1), r2=25(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple rectangular region at (137, 131) spanning 49 by 46 pixels.
; PLAN: r0=137(x), r1=131(y), r2=49(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 131
LDI r2, 49
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue line from (47, 191) to (25, 208).
; PLAN: r0=47(x1), r1=191(y1), r2=25(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 191
LDI r2, 25
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

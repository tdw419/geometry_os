; DESCRIPTION: Composite: . Then Draws a black line from (191, 126) to (15, 67). Then Creates a black rectangular region at (58, 29) spanning 33 by 75 pixels.
; PLAN: r0=191(x1), r1=126(y1), r2=15(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=58(x), r1=29(y), r2=33(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (191, 126) to (15, 67).
; PLAN: r0=191(x1), r1=126(y1), r2=15(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 126
LDI r2, 15
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black rectangular region at (58, 29) spanning 33 by 75 pixels.
; PLAN: r0=58(x), r1=29(y), r2=33(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 29
LDI r2, 33
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

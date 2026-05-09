; DESCRIPTION: Composite: . Then Places a red 67x78 rectangle at position (142, 174). Then Draws a blue line from (248, 237) to (83, 70).
; PLAN: r0=142(x), r1=174(y), r2=67(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=248(x1), r1=237(y1), r2=83(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red 67x78 rectangle at position (142, 174).
; PLAN: r0=142(x), r1=174(y), r2=67(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 174
LDI r2, 67
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue line from (248, 237) to (83, 70).
; PLAN: r0=248(x1), r1=237(y1), r2=83(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 237
LDI r2, 83
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

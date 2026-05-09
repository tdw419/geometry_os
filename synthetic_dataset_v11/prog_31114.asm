; DESCRIPTION: Composite: . Then Places a purple line segment connecting (14, 42) to (10, 133). Then Creates a blue rectangular region at (79, 29) spanning 36 by 79 pixels.
; PLAN: r0=14(x1), r1=42(y1), r2=10(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=79(x), r1=29(y), r2=36(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (14, 42) to (10, 133).
; PLAN: r0=14(x1), r1=42(y1), r2=10(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 42
LDI r2, 10
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue rectangular region at (79, 29) spanning 36 by 79 pixels.
; PLAN: r0=79(x), r1=29(y), r2=36(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 29
LDI r2, 36
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

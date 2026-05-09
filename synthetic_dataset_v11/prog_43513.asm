; DESCRIPTION: Composite: . Then Draws a orange line from (22, 192) to (221, 30). Then Creates a purple rectangular region at (205, 150) spanning 32 by 72 pixels.
; PLAN: r0=22(x1), r1=192(y1), r2=221(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=205(x), r1=150(y), r2=32(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (22, 192) to (221, 30).
; PLAN: r0=22(x1), r1=192(y1), r2=221(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 192
LDI r2, 221
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (205, 150) spanning 32 by 72 pixels.
; PLAN: r0=205(x), r1=150(y), r2=32(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 150
LDI r2, 32
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

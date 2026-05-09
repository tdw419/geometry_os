; DESCRIPTION: Composite: . Then Draws a orange line from (126, 110) to (247, 68). Then Creates a white rectangular region at (72, 134) spanning 64 by 108 pixels.
; PLAN: r0=126(x1), r1=110(y1), r2=247(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=72(x), r1=134(y), r2=64(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (126, 110) to (247, 68).
; PLAN: r0=126(x1), r1=110(y1), r2=247(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 110
LDI r2, 247
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white rectangular region at (72, 134) spanning 64 by 108 pixels.
; PLAN: r0=72(x), r1=134(y), r2=64(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 134
LDI r2, 64
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

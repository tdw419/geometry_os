; DESCRIPTION: Composite: . Then Draws a purple line from (233, 11) to (133, 100). Then Creates a orange rectangular region at (19, 111) spanning 99 by 27 pixels.
; PLAN: r0=233(x1), r1=11(y1), r2=133(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=19(x), r1=111(y), r2=99(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple line from (233, 11) to (133, 100).
; PLAN: r0=233(x1), r1=11(y1), r2=133(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 11
LDI r2, 133
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange rectangular region at (19, 111) spanning 99 by 27 pixels.
; PLAN: r0=19(x), r1=111(y), r2=99(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 111
LDI r2, 99
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

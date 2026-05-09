; DESCRIPTION: Composite: . Then Places a orange line segment connecting (240, 71) to (8, 27). Then Creates a purple rectangular region at (111, 145) spanning 84 by 31 pixels.
; PLAN: r0=240(x1), r1=71(y1), r2=8(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=111(x), r1=145(y), r2=84(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (240, 71) to (8, 27).
; PLAN: r0=240(x1), r1=71(y1), r2=8(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 71
LDI r2, 8
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (111, 145) spanning 84 by 31 pixels.
; PLAN: r0=111(x), r1=145(y), r2=84(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 145
LDI r2, 84
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

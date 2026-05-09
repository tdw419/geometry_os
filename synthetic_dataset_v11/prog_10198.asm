; DESCRIPTION: Composite: . Then Renders a orange box of size 27x82 starting at (6, 108). Then Renders a purple line between points (2, 65) and (5, 145).
; PLAN: r0=6(x), r1=108(y), r2=27(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=2(x1), r1=65(y1), r2=5(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange box of size 27x82 starting at (6, 108).
; PLAN: r0=6(x), r1=108(y), r2=27(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 108
LDI r2, 27
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple line between points (2, 65) and (5, 145).
; PLAN: r0=2(x1), r1=65(y1), r2=5(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 65
LDI r2, 5
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

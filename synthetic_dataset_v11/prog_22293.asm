; DESCRIPTION: Composite: . Then Renders a magenta box of size 68x38 starting at (32, 76). Then Draws a orange line from (60, 135) to (232, 162).
; PLAN: r0=32(x), r1=76(y), r2=68(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=60(x1), r1=135(y1), r2=232(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta box of size 68x38 starting at (32, 76).
; PLAN: r0=32(x), r1=76(y), r2=68(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 76
LDI r2, 68
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange line from (60, 135) to (232, 162).
; PLAN: r0=60(x1), r1=135(y1), r2=232(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 135
LDI r2, 232
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

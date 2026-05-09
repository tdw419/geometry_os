; DESCRIPTION: Composite: . Then Draws a black line from (170, 247) to (60, 48). Then Creates a magenta rectangular region at (24, 66) spanning 68 by 22 pixels.
; PLAN: r0=170(x1), r1=247(y1), r2=60(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=24(x), r1=66(y), r2=68(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (170, 247) to (60, 48).
; PLAN: r0=170(x1), r1=247(y1), r2=60(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 247
LDI r2, 60
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta rectangular region at (24, 66) spanning 68 by 22 pixels.
; PLAN: r0=24(x), r1=66(y), r2=68(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 66
LDI r2, 68
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

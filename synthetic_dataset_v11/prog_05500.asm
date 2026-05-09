; DESCRIPTION: Composite: . Then Places a purple 102x47 rectangle at position (145, 73). Then Draws a yellow line from (135, 146) to (149, 49).
; PLAN: r0=145(x), r1=73(y), r2=102(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=135(x1), r1=146(y1), r2=149(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple 102x47 rectangle at position (145, 73).
; PLAN: r0=145(x), r1=73(y), r2=102(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 73
LDI r2, 102
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (135, 146) to (149, 49).
; PLAN: r0=135(x1), r1=146(y1), r2=149(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 146
LDI r2, 149
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Places a orange 91x73 rectangle at position (148, 153). Then Draws a orange line from (100, 153) to (137, 170).
; PLAN: r0=148(x), r1=153(y), r2=91(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=100(x1), r1=153(y1), r2=137(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange 91x73 rectangle at position (148, 153).
; PLAN: r0=148(x), r1=153(y), r2=91(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 153
LDI r2, 91
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange line from (100, 153) to (137, 170).
; PLAN: r0=100(x1), r1=153(y1), r2=137(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 153
LDI r2, 137
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

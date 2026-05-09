; DESCRIPTION: Composite: . Then Places a blue line segment connecting (166, 236) to (58, 95). Then Creates a orange rectangular region at (100, 217) spanning 53 by 36 pixels.
; PLAN: r0=166(x1), r1=236(y1), r2=58(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=100(x), r1=217(y), r2=53(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (166, 236) to (58, 95).
; PLAN: r0=166(x1), r1=236(y1), r2=58(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 236
LDI r2, 58
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange rectangular region at (100, 217) spanning 53 by 36 pixels.
; PLAN: r0=100(x), r1=217(y), r2=53(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 217
LDI r2, 53
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

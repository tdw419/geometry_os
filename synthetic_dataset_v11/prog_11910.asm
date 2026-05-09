; DESCRIPTION: Composite: . Then Creates a red rectangular region at (45, 116) spanning 25 by 58 pixels. Then Draws a blue line from (116, 32) to (34, 252).
; PLAN: r0=45(x), r1=116(y), r2=25(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=116(x1), r1=32(y1), r2=34(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red rectangular region at (45, 116) spanning 25 by 58 pixels.
; PLAN: r0=45(x), r1=116(y), r2=25(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 116
LDI r2, 25
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue line from (116, 32) to (34, 252).
; PLAN: r0=116(x1), r1=32(y1), r2=34(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 32
LDI r2, 34
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

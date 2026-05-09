; DESCRIPTION: Composite: . Then Draws a magenta line from (136, 222) to (122, 194). Then Places a orange 34x47 rectangle at position (158, 79).
; PLAN: r0=136(x1), r1=222(y1), r2=122(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=158(x), r1=79(y), r2=34(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta line from (136, 222) to (122, 194).
; PLAN: r0=136(x1), r1=222(y1), r2=122(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 222
LDI r2, 122
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 34x47 rectangle at position (158, 79).
; PLAN: r0=158(x), r1=79(y), r2=34(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 79
LDI r2, 34
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

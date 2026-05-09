; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (3, 143) spanning 92 by 88 pixels. Then Draws a magenta line from (234, 43) to (180, 205).
; PLAN: r0=3(x), r1=143(y), r2=92(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=234(x1), r1=43(y1), r2=180(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta rectangular region at (3, 143) spanning 92 by 88 pixels.
; PLAN: r0=3(x), r1=143(y), r2=92(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 143
LDI r2, 92
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta line from (234, 43) to (180, 205).
; PLAN: r0=234(x1), r1=43(y1), r2=180(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 43
LDI r2, 180
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

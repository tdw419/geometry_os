; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (161, 43) spanning 61 by 67 pixels. Then Draws a magenta line from (6, 71) to (90, 184).
; PLAN: r0=161(x), r1=43(y), r2=61(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=6(x1), r1=71(y1), r2=90(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta rectangular region at (161, 43) spanning 61 by 67 pixels.
; PLAN: r0=161(x), r1=43(y), r2=61(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 43
LDI r2, 61
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta line from (6, 71) to (90, 184).
; PLAN: r0=6(x1), r1=71(y1), r2=90(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 71
LDI r2, 90
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

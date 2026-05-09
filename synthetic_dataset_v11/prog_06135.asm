; DESCRIPTION: Composite: . Then Places a green line segment connecting (134, 166) to (116, 57). Then Draws a purple rectangle at (46, 55) with width 65 and height 22.
; PLAN: r0=134(x1), r1=166(y1), r2=116(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=46(x), r1=55(y), r2=65(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green line segment connecting (134, 166) to (116, 57).
; PLAN: r0=134(x1), r1=166(y1), r2=116(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 166
LDI r2, 116
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (46, 55) with width 65 and height 22.
; PLAN: r0=46(x), r1=55(y), r2=65(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 55
LDI r2, 65
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (23, 165) to (115, 177). Then Draws a purple rectangle at (163, 10) with width 72 and height 79.
; PLAN: r0=23(x1), r1=165(y1), r2=115(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=163(x), r1=10(y), r2=72(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (23, 165) to (115, 177).
; PLAN: r0=23(x1), r1=165(y1), r2=115(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 165
LDI r2, 115
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (163, 10) with width 72 and height 79.
; PLAN: r0=163(x), r1=10(y), r2=72(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 10
LDI r2, 72
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

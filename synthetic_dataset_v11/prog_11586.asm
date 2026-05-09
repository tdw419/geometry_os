; DESCRIPTION: Composite: . Then Draws a magenta line from (186, 72) to (153, 30). Then Renders a purple box of size 77x113 starting at (136, 129).
; PLAN: r0=186(x1), r1=72(y1), r2=153(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=136(x), r1=129(y), r2=77(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta line from (186, 72) to (153, 30).
; PLAN: r0=186(x1), r1=72(y1), r2=153(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 72
LDI r2, 153
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 77x113 starting at (136, 129).
; PLAN: r0=136(x), r1=129(y), r2=77(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 129
LDI r2, 77
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

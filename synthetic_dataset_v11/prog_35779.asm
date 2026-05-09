; DESCRIPTION: Composite: . Then Renders a white box of size 106x44 starting at (126, 122). Then Draws a magenta line from (104, 4) to (155, 209).
; PLAN: r0=126(x), r1=122(y), r2=106(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=104(x1), r1=4(y1), r2=155(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white box of size 106x44 starting at (126, 122).
; PLAN: r0=126(x), r1=122(y), r2=106(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 122
LDI r2, 106
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta line from (104, 4) to (155, 209).
; PLAN: r0=104(x1), r1=4(y1), r2=155(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 4
LDI r2, 155
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

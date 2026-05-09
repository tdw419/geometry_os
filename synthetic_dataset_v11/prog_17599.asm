; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (222, 165) to (226, 130). Then Places a purple 107x105 rectangle at position (140, 75).
; PLAN: r0=222(x1), r1=165(y1), r2=226(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=140(x), r1=75(y), r2=107(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (222, 165) to (226, 130).
; PLAN: r0=222(x1), r1=165(y1), r2=226(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 165
LDI r2, 226
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 107x105 rectangle at position (140, 75).
; PLAN: r0=140(x), r1=75(y), r2=107(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 75
LDI r2, 107
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

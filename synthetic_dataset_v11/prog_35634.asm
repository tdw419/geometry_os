; DESCRIPTION: Composite: . Then Draws a green rectangle at (20, 118) with width 93 and height 82. Then Places a green line segment connecting (125, 144) to (205, 226).
; PLAN: r0=20(x), r1=118(y), r2=93(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=125(x1), r1=144(y1), r2=205(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green rectangle at (20, 118) with width 93 and height 82.
; PLAN: r0=20(x), r1=118(y), r2=93(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 118
LDI r2, 93
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green line segment connecting (125, 144) to (205, 226).
; PLAN: r0=125(x1), r1=144(y1), r2=205(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 144
LDI r2, 205
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

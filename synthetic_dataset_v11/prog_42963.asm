; DESCRIPTION: Composite: . Then Draws a black rectangle at (159, 107) with width 91 and height 61. Then Places a red line segment connecting (196, 127) to (60, 161).
; PLAN: r0=159(x), r1=107(y), r2=91(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=196(x1), r1=127(y1), r2=60(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black rectangle at (159, 107) with width 91 and height 61.
; PLAN: r0=159(x), r1=107(y), r2=91(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 107
LDI r2, 91
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (196, 127) to (60, 161).
; PLAN: r0=196(x1), r1=127(y1), r2=60(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 127
LDI r2, 60
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Renders a white line between points (114, 175) and (182, 119). Then Draws a white rectangle at (26, 85) with width 107 and height 44.
; PLAN: r0=114(x1), r1=175(y1), r2=182(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=26(x), r1=85(y), r2=107(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white line between points (114, 175) and (182, 119).
; PLAN: r0=114(x1), r1=175(y1), r2=182(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 175
LDI r2, 182
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (26, 85) with width 107 and height 44.
; PLAN: r0=26(x), r1=85(y), r2=107(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 85
LDI r2, 107
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

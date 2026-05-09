; DESCRIPTION: Composite: . Then Renders a white line between points (248, 225) and (190, 61). Then Draws a green rectangle at (75, 58) with width 87 and height 76.
; PLAN: r0=248(x1), r1=225(y1), r2=190(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=75(x), r1=58(y), r2=87(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white line between points (248, 225) and (190, 61).
; PLAN: r0=248(x1), r1=225(y1), r2=190(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 225
LDI r2, 190
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green rectangle at (75, 58) with width 87 and height 76.
; PLAN: r0=75(x), r1=58(y), r2=87(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 58
LDI r2, 87
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Draws a white rectangle at (114, 131) with width 114 and height 37. Then Renders a cyan line between points (216, 76) and (201, 14).
; PLAN: r0=114(x), r1=131(y), r2=114(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=216(x1), r1=76(y1), r2=201(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (114, 131) with width 114 and height 37.
; PLAN: r0=114(x), r1=131(y), r2=114(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 131
LDI r2, 114
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (216, 76) and (201, 14).
; PLAN: r0=216(x1), r1=76(y1), r2=201(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 76
LDI r2, 201
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

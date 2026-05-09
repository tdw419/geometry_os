; DESCRIPTION: Composite: . Then Draws a red rectangle at (201, 210) with width 55 and height 14. Then Renders a black line between points (108, 246) and (119, 49).
; PLAN: r0=201(x), r1=210(y), r2=55(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=108(x1), r1=246(y1), r2=119(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red rectangle at (201, 210) with width 55 and height 14.
; PLAN: r0=201(x), r1=210(y), r2=55(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 210
LDI r2, 55
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black line between points (108, 246) and (119, 49).
; PLAN: r0=108(x1), r1=246(y1), r2=119(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 246
LDI r2, 119
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

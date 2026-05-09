; DESCRIPTION: Composite: . Then Draws a orange rectangle at (31, 180) with width 81 and height 30. Then Renders a blue line between points (0, 16) and (230, 37).
; PLAN: r0=31(x), r1=180(y), r2=81(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=0(x1), r1=16(y1), r2=230(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange rectangle at (31, 180) with width 81 and height 30.
; PLAN: r0=31(x), r1=180(y), r2=81(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 180
LDI r2, 81
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue line between points (0, 16) and (230, 37).
; PLAN: r0=0(x1), r1=16(y1), r2=230(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 16
LDI r2, 230
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Draws a purple rectangle at (138, 207) with width 40 and height 19. Then Places a green line segment connecting (148, 60) to (39, 5).
; PLAN: r0=138(x), r1=207(y), r2=40(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=148(x1), r1=60(y1), r2=39(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple rectangle at (138, 207) with width 40 and height 19.
; PLAN: r0=138(x), r1=207(y), r2=40(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 207
LDI r2, 40
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green line segment connecting (148, 60) to (39, 5).
; PLAN: r0=148(x1), r1=60(y1), r2=39(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 60
LDI r2, 39
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

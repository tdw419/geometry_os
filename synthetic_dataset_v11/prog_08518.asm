; DESCRIPTION: Composite: . Then Draws a blue rectangle at (231, 19) with width 12 and height 68. Then Places a green line segment connecting (165, 189) to (255, 79).
; PLAN: r0=231(x), r1=19(y), r2=12(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=165(x1), r1=189(y1), r2=255(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (231, 19) with width 12 and height 68.
; PLAN: r0=231(x), r1=19(y), r2=12(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 19
LDI r2, 12
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green line segment connecting (165, 189) to (255, 79).
; PLAN: r0=165(x1), r1=189(y1), r2=255(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 189
LDI r2, 255
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

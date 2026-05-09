; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (94, 161) to (220, 195). Then Draws a blue rectangle at (141, 21) with width 16 and height 80.
; PLAN: r0=94(x1), r1=161(y1), r2=220(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=141(x), r1=21(y), r2=16(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow line segment connecting (94, 161) to (220, 195).
; PLAN: r0=94(x1), r1=161(y1), r2=220(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 161
LDI r2, 220
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue rectangle at (141, 21) with width 16 and height 80.
; PLAN: r0=141(x), r1=21(y), r2=16(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 21
LDI r2, 16
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

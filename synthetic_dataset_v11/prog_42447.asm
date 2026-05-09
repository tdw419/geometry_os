; DESCRIPTION: Composite: . Then Draws a blue rectangle at (54, 210) with width 32 and height 39. Then Places a yellow line segment connecting (82, 15) to (177, 127).
; PLAN: r0=54(x), r1=210(y), r2=32(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=82(x1), r1=15(y1), r2=177(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (54, 210) with width 32 and height 39.
; PLAN: r0=54(x), r1=210(y), r2=32(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 210
LDI r2, 32
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (82, 15) to (177, 127).
; PLAN: r0=82(x1), r1=15(y1), r2=177(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 15
LDI r2, 177
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

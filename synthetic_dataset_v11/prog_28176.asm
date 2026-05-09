; DESCRIPTION: Composite: . Then Places a blue line segment connecting (150, 57) to (150, 247). Then Draws a orange rectangle at (192, 202) with width 64 and height 39.
; PLAN: r0=150(x1), r1=57(y1), r2=150(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=192(x), r1=202(y), r2=64(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (150, 57) to (150, 247).
; PLAN: r0=150(x1), r1=57(y1), r2=150(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 57
LDI r2, 150
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange rectangle at (192, 202) with width 64 and height 39.
; PLAN: r0=192(x), r1=202(y), r2=64(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 202
LDI r2, 64
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Draws a green circle centered at (165, 110) with radius 14. Then Places a blue 74x87 rectangle at position (140, 168).
; PLAN: r0=165(x), r1=110(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=140(x), r1=168(y), r2=74(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (165, 110) with radius 14.
; PLAN: r0=165(x), r1=110(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 110
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 74x87 rectangle at position (140, 168).
; PLAN: r0=140(x), r1=168(y), r2=74(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 168
LDI r2, 74
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

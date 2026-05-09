; DESCRIPTION: Composite: . Then Places a purple 48x35 rectangle at position (162, 122). Then Draws a purple circle centered at (80, 146) with radius 52.
; PLAN: r0=162(x), r1=122(y), r2=48(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=80(x), r1=146(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple 48x35 rectangle at position (162, 122).
; PLAN: r0=162(x), r1=122(y), r2=48(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 122
LDI r2, 48
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (80, 146) with radius 52.
; PLAN: r0=80(x), r1=146(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 146
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

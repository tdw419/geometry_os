; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (98, 76) with radius 68. Then Draws a red line from (254, 157) to (15, 70).
; PLAN: r0=98(x), r1=76(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=254(x1), r1=157(y1), r2=15(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (98, 76) with radius 68.
; PLAN: r0=98(x), r1=76(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 76
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (254, 157) to (15, 70).
; PLAN: r0=254(x1), r1=157(y1), r2=15(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 157
LDI r2, 15
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

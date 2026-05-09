; DESCRIPTION: Composite: . Then Draws a orange circle centered at (35, 62) with radius 10. Then Renders a blue line between points (210, 84) and (157, 121).
; PLAN: r0=35(x), r1=62(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=210(x1), r1=84(y1), r2=157(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (35, 62) with radius 10.
; PLAN: r0=35(x), r1=62(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 62
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue line between points (210, 84) and (157, 121).
; PLAN: r0=210(x1), r1=84(y1), r2=157(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 84
LDI r2, 157
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Renders a yellow box of size 115x49 starting at (71, 10). Then Draws a orange line from (181, 184) to (244, 119).
; PLAN: r0=71(x), r1=10(y), r2=115(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=181(x1), r1=184(y1), r2=244(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow box of size 115x49 starting at (71, 10).
; PLAN: r0=71(x), r1=10(y), r2=115(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 10
LDI r2, 115
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange line from (181, 184) to (244, 119).
; PLAN: r0=181(x1), r1=184(y1), r2=244(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 184
LDI r2, 244
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

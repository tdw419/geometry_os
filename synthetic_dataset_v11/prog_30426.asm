; DESCRIPTION: Composite: . Then Draws a orange line from (167, 60) to (53, 235). Then Places a red circle of radius 76 at center (108, 106).
; PLAN: r0=167(x1), r1=60(y1), r2=53(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=108(x), r1=106(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange line from (167, 60) to (53, 235).
; PLAN: r0=167(x1), r1=60(y1), r2=53(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 60
LDI r2, 53
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 76 at center (108, 106).
; PLAN: r0=108(x), r1=106(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 106
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

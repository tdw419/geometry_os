; DESCRIPTION: Composite: . Then Draws a white circle centered at (124, 124) with radius 62. Then Draws a red line from (53, 238) to (31, 118).
; PLAN: r0=124(x), r1=124(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=53(x1), r1=238(y1), r2=31(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (124, 124) with radius 62.
; PLAN: r0=124(x), r1=124(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 124
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (53, 238) to (31, 118).
; PLAN: r0=53(x1), r1=238(y1), r2=31(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 238
LDI r2, 31
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

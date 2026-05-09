; DESCRIPTION: Composite: . Then Draws a purple line from (108, 122) to (41, 237). Then Places a purple dot at position (165, 214).
; PLAN: r0=108(x1), r1=122(y1), r2=41(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=165(x), r1=214(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (108, 122) to (41, 237).
; PLAN: r0=108(x1), r1=122(y1), r2=41(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 122
LDI r2, 41
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (165, 214).
; PLAN: r0=165(x), r1=214(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 214
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT

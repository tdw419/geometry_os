; DESCRIPTION: Composite: . Then Renders a red line between points (202, 122) and (206, 53). Then Places a purple dot at position (17, 8).
; PLAN: r0=202(x1), r1=122(y1), r2=206(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=17(x), r1=8(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red line between points (202, 122) and (206, 53).
; PLAN: r0=202(x1), r1=122(y1), r2=206(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 122
LDI r2, 206
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (17, 8).
; PLAN: r0=17(x), r1=8(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 8
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT

; DESCRIPTION: Composite: . Then Places a white dot at position (239, 142). Then Renders a red line between points (3, 69) and (118, 67).
; PLAN: r0=239(x), r1=142(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=3(x1), r1=69(y1), r2=118(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (239, 142).
; PLAN: r0=239(x), r1=142(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 142
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (3, 69) and (118, 67).
; PLAN: r0=3(x1), r1=69(y1), r2=118(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 69
LDI r2, 118
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

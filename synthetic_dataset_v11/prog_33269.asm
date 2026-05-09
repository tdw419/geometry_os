; DESCRIPTION: Composite: . Then Renders a white line between points (191, 74) and (69, 15). Then Sets a single magenta pixel at (104, 81).
; PLAN: r0=191(x1), r1=74(y1), r2=69(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=104(x), r1=81(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white line between points (191, 74) and (69, 15).
; PLAN: r0=191(x1), r1=74(y1), r2=69(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 74
LDI r2, 69
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (104, 81).
; PLAN: r0=104(x), r1=81(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 81
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT

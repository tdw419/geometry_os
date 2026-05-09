; DESCRIPTION: Composite: . Then Renders a blue line between points (210, 182) and (104, 178). Then Places a black dot at position (178, 239).
; PLAN: r0=210(x1), r1=182(y1), r2=104(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=178(x), r1=239(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (210, 182) and (104, 178).
; PLAN: r0=210(x1), r1=182(y1), r2=104(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 182
LDI r2, 104
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (178, 239).
; PLAN: r0=178(x), r1=239(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 239
LDI r2, 0x000000
PSET r0, r1, r2
HALT

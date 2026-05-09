; DESCRIPTION: Composite: . Then Renders a white line between points (103, 203) and (66, 32). Then Places a black dot at position (216, 63).
; PLAN: r0=103(x1), r1=203(y1), r2=66(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=216(x), r1=63(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white line between points (103, 203) and (66, 32).
; PLAN: r0=103(x1), r1=203(y1), r2=66(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 203
LDI r2, 66
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (216, 63).
; PLAN: r0=216(x), r1=63(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 63
LDI r2, 0x000000
PSET r0, r1, r2
HALT

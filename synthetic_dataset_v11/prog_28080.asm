; DESCRIPTION: Composite: . Then Renders a magenta line between points (22, 43) and (60, 115). Then Places a black dot at position (174, 103).
; PLAN: r0=22(x1), r1=43(y1), r2=60(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=174(x), r1=103(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (22, 43) and (60, 115).
; PLAN: r0=22(x1), r1=43(y1), r2=60(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 43
LDI r2, 60
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (174, 103).
; PLAN: r0=174(x), r1=103(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 103
LDI r2, 0x000000
PSET r0, r1, r2
HALT

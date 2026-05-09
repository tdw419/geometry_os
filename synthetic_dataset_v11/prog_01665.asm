; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (132, 138) to (87, 141). Then Places a white dot at position (138, 241).
; PLAN: r0=132(x1), r1=138(y1), r2=87(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=138(x), r1=241(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (132, 138) to (87, 141).
; PLAN: r0=132(x1), r1=138(y1), r2=87(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 138
LDI r2, 87
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (138, 241).
; PLAN: r0=138(x), r1=241(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 241
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT

; DESCRIPTION: Composite: . Then Places a black line segment connecting (174, 209) to (178, 140). Then Places a magenta dot at position (122, 246).
; PLAN: r0=174(x1), r1=209(y1), r2=178(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=122(x), r1=246(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (174, 209) to (178, 140).
; PLAN: r0=174(x1), r1=209(y1), r2=178(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 209
LDI r2, 178
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (122, 246).
; PLAN: r0=122(x), r1=246(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 246
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT

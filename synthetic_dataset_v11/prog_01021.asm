; DESCRIPTION: Composite: . Then Places a white dot at position (12, 40). Then Places a blue line segment connecting (59, 236) to (132, 73).
; PLAN: r0=12(x), r1=40(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=59(x1), r1=236(y1), r2=132(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (12, 40).
; PLAN: r0=12(x), r1=40(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 40
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a blue line segment connecting (59, 236) to (132, 73).
; PLAN: r0=59(x1), r1=236(y1), r2=132(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 236
LDI r2, 132
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Places a orange dot at position (26, 170). Then Places a white line segment connecting (124, 209) to (16, 19).
; PLAN: r0=26(x), r1=170(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=124(x1), r1=209(y1), r2=16(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (26, 170).
; PLAN: r0=26(x), r1=170(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 170
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a white line segment connecting (124, 209) to (16, 19).
; PLAN: r0=124(x1), r1=209(y1), r2=16(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 209
LDI r2, 16
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

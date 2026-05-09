; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (207, 175) to (49, 112). Then Places a cyan dot at position (106, 129).
; PLAN: r0=207(x1), r1=175(y1), r2=49(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=106(x), r1=129(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (207, 175) to (49, 112).
; PLAN: r0=207(x1), r1=175(y1), r2=49(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 175
LDI r2, 49
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (106, 129).
; PLAN: r0=106(x), r1=129(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 129
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT

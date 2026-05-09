; DESCRIPTION: Composite: . Then Places a blue line segment connecting (205, 187) to (214, 17). Then Places a white dot at position (235, 222).
; PLAN: r0=205(x1), r1=187(y1), r2=214(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=235(x), r1=222(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue line segment connecting (205, 187) to (214, 17).
; PLAN: r0=205(x1), r1=187(y1), r2=214(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 187
LDI r2, 214
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (235, 222).
; PLAN: r0=235(x), r1=222(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 222
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT

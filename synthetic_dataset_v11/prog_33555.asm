; DESCRIPTION: Composite: . Then Places a green dot at position (211, 134). Then Places a magenta line segment connecting (56, 112) to (235, 22).
; PLAN: r0=211(x), r1=134(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=56(x1), r1=112(y1), r2=235(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (211, 134).
; PLAN: r0=211(x), r1=134(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 134
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a magenta line segment connecting (56, 112) to (235, 22).
; PLAN: r0=56(x1), r1=112(y1), r2=235(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 112
LDI r2, 235
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

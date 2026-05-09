; DESCRIPTION: Composite: . Then Renders a orange line between points (70, 235) and (2, 184). Then Places a green dot at position (177, 187).
; PLAN: r0=70(x1), r1=235(y1), r2=2(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=177(x), r1=187(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (70, 235) and (2, 184).
; PLAN: r0=70(x1), r1=235(y1), r2=2(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 235
LDI r2, 2
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (177, 187).
; PLAN: r0=177(x), r1=187(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 187
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT

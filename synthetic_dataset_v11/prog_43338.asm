; DESCRIPTION: Composite: . Then Draws a green line from (204, 43) to (86, 108). Then Places a white dot at position (235, 247).
; PLAN: r0=204(x1), r1=43(y1), r2=86(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=235(x), r1=247(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (204, 43) to (86, 108).
; PLAN: r0=204(x1), r1=43(y1), r2=86(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 43
LDI r2, 86
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (235, 247).
; PLAN: r0=235(x), r1=247(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 247
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT

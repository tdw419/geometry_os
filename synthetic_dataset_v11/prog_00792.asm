; DESCRIPTION: Composite: . Then Places a red dot at position (82, 235). Then Places a yellow line segment connecting (205, 85) to (81, 107).
; PLAN: r0=82(x), r1=235(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=205(x1), r1=85(y1), r2=81(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (82, 235).
; PLAN: r0=82(x), r1=235(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 235
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (205, 85) to (81, 107).
; PLAN: r0=205(x1), r1=85(y1), r2=81(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 85
LDI r2, 81
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Places a cyan dot at position (235, 85). Then Places a magenta line segment connecting (231, 55) to (47, 25).
; PLAN: r0=235(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=231(x1), r1=55(y1), r2=47(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (235, 85).
; PLAN: r0=235(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 85
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta line segment connecting (231, 55) to (47, 25).
; PLAN: r0=231(x1), r1=55(y1), r2=47(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 55
LDI r2, 47
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

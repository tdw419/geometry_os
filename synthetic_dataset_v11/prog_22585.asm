; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (207, 136) to (111, 68). Then Places a magenta dot at position (30, 235).
; PLAN: r0=207(x1), r1=136(y1), r2=111(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=30(x), r1=235(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (207, 136) to (111, 68).
; PLAN: r0=207(x1), r1=136(y1), r2=111(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 136
LDI r2, 111
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (30, 235).
; PLAN: r0=30(x), r1=235(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 235
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT

; DESCRIPTION: Places a green line segment connecting (164, 251) to (197, 235).
; PLAN: r0=164(x1), r1=251(y1), r2=197(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 251
LDI r2, 197
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green line segment connecting (235, 4) to (197, 91).
; PLAN: r0=235(x1), r1=4(y1), r2=197(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 4
LDI r2, 197
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

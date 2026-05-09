; DESCRIPTION: Composite: . Then Places a green line segment connecting (154, 0) to (150, 159). Then Places a green dot at position (231, 51).
; PLAN: r0=154(x1), r1=0(y1), r2=150(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=231(x), r1=51(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (154, 0) to (150, 159).
; PLAN: r0=154(x1), r1=0(y1), r2=150(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 0
LDI r2, 150
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (231, 51).
; PLAN: r0=231(x), r1=51(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 51
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT

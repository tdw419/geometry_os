; DESCRIPTION: Composite: . Then Places a black dot at position (50, 156). Then Places a white line segment connecting (206, 110) to (16, 150).
; PLAN: r0=50(x), r1=156(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=206(x1), r1=110(y1), r2=16(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (50, 156).
; PLAN: r0=50(x), r1=156(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 156
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a white line segment connecting (206, 110) to (16, 150).
; PLAN: r0=206(x1), r1=110(y1), r2=16(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 110
LDI r2, 16
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

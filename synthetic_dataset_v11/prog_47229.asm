; DESCRIPTION: Composite: . Then Draws a white line from (172, 22) to (87, 50). Then Places a yellow dot at position (150, 53).
; PLAN: r0=172(x1), r1=22(y1), r2=87(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=150(x), r1=53(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (172, 22) to (87, 50).
; PLAN: r0=172(x1), r1=22(y1), r2=87(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 22
LDI r2, 87
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (150, 53).
; PLAN: r0=150(x), r1=53(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 53
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT

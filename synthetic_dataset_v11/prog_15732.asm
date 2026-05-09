; DESCRIPTION: Composite: . Then Draws a green line from (87, 71) to (184, 174). Then Places a black dot at position (49, 189).
; PLAN: r0=87(x1), r1=71(y1), r2=184(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=49(x), r1=189(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (87, 71) to (184, 174).
; PLAN: r0=87(x1), r1=71(y1), r2=184(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 71
LDI r2, 184
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (49, 189).
; PLAN: r0=49(x), r1=189(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 189
LDI r2, 0x000000
PSET r0, r1, r2
HALT

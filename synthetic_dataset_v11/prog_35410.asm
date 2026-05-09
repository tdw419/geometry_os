; DESCRIPTION: Composite: . Then Places a cyan dot at position (102, 176). Then Draws a blue line from (229, 251) to (103, 223).
; PLAN: r0=102(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=229(x1), r1=251(y1), r2=103(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (102, 176).
; PLAN: r0=102(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 176
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue line from (229, 251) to (103, 223).
; PLAN: r0=229(x1), r1=251(y1), r2=103(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 251
LDI r2, 103
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

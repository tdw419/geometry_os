; DESCRIPTION: Composite: . Then Places a red dot at position (216, 32). Then Draws a green line from (211, 14) to (173, 251).
; PLAN: r0=216(x), r1=32(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=211(x1), r1=14(y1), r2=173(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (216, 32).
; PLAN: r0=216(x), r1=32(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 32
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (211, 14) to (173, 251).
; PLAN: r0=211(x1), r1=14(y1), r2=173(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 14
LDI r2, 173
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

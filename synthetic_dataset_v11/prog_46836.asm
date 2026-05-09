; DESCRIPTION: Composite: . Then Draws a green line from (73, 171) to (252, 138). Then Places a purple dot at position (3, 50).
; PLAN: r0=73(x1), r1=171(y1), r2=252(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=3(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (73, 171) to (252, 138).
; PLAN: r0=73(x1), r1=171(y1), r2=252(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 171
LDI r2, 252
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (3, 50).
; PLAN: r0=3(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT

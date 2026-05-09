; DESCRIPTION: Composite: . Then Draws a white line from (176, 238) to (90, 0). Then Places a black dot at position (110, 214).
; PLAN: r0=176(x1), r1=238(y1), r2=90(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=110(x), r1=214(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (176, 238) to (90, 0).
; PLAN: r0=176(x1), r1=238(y1), r2=90(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 238
LDI r2, 90
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (110, 214).
; PLAN: r0=110(x), r1=214(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 214
LDI r2, 0x000000
PSET r0, r1, r2
HALT

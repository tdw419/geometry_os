; DESCRIPTION: Composite: . Then Draws a black line from (117, 205) to (133, 226). Then Places a white dot at position (38, 73).
; PLAN: r0=117(x1), r1=205(y1), r2=133(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=38(x), r1=73(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black line from (117, 205) to (133, 226).
; PLAN: r0=117(x1), r1=205(y1), r2=133(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 205
LDI r2, 133
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (38, 73).
; PLAN: r0=38(x), r1=73(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 38
LDI r1, 73
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT

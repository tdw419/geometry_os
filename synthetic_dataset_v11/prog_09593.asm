; DESCRIPTION: Composite: . Then Draws a yellow line from (184, 143) to (149, 16). Then Places a red dot at position (93, 41).
; PLAN: r0=184(x1), r1=143(y1), r2=149(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=93(x), r1=41(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow line from (184, 143) to (149, 16).
; PLAN: r0=184(x1), r1=143(y1), r2=149(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 143
LDI r2, 149
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (93, 41).
; PLAN: r0=93(x), r1=41(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 41
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT

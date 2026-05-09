; DESCRIPTION: Composite: . Then Draws a red line from (63, 13) to (210, 48). Then Places a red dot at position (31, 98).
; PLAN: r0=63(x1), r1=13(y1), r2=210(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=31(x), r1=98(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (63, 13) to (210, 48).
; PLAN: r0=63(x1), r1=13(y1), r2=210(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 13
LDI r2, 210
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (31, 98).
; PLAN: r0=31(x), r1=98(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 98
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT

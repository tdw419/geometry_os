; DESCRIPTION: Composite: . Then Draws a orange line from (96, 11) to (60, 157). Then Places a white dot at position (102, 218).
; PLAN: r0=96(x1), r1=11(y1), r2=60(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=102(x), r1=218(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange line from (96, 11) to (60, 157).
; PLAN: r0=96(x1), r1=11(y1), r2=60(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 11
LDI r2, 60
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (102, 218).
; PLAN: r0=102(x), r1=218(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 218
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT

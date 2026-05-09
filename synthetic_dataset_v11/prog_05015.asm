; DESCRIPTION: Composite: . Then Draws a orange line from (18, 160) to (149, 180). Then Sets a single cyan pixel at (210, 32).
; PLAN: r0=18(x1), r1=160(y1), r2=149(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=210(x), r1=32(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange line from (18, 160) to (149, 180).
; PLAN: r0=18(x1), r1=160(y1), r2=149(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 160
LDI r2, 149
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (210, 32).
; PLAN: r0=210(x), r1=32(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 32
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT

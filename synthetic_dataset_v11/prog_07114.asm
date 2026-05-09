; DESCRIPTION: Composite: . Then Draws a cyan line from (0, 12) to (75, 175). Then Places a magenta dot at position (145, 77).
; PLAN: r0=0(x1), r1=12(y1), r2=75(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=145(x), r1=77(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan line from (0, 12) to (75, 175).
; PLAN: r0=0(x1), r1=12(y1), r2=75(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 12
LDI r2, 75
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (145, 77).
; PLAN: r0=145(x), r1=77(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 145
LDI r1, 77
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT

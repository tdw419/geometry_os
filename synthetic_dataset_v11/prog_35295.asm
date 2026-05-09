; DESCRIPTION: Composite: . Then Draws a yellow line from (220, 134) to (199, 59). Then Sets a single red pixel at (138, 164).
; PLAN: r0=220(x1), r1=134(y1), r2=199(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=138(x), r1=164(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow line from (220, 134) to (199, 59).
; PLAN: r0=220(x1), r1=134(y1), r2=199(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 134
LDI r2, 199
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (138, 164).
; PLAN: r0=138(x), r1=164(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 164
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT

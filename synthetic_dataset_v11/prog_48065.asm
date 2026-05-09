; DESCRIPTION: Composite: . Then Places a white dot at position (44, 210). Then Draws a blue line from (115, 171) to (15, 117).
; PLAN: r0=44(x), r1=210(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=115(x1), r1=171(y1), r2=15(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (44, 210).
; PLAN: r0=44(x), r1=210(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 210
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue line from (115, 171) to (15, 117).
; PLAN: r0=115(x1), r1=171(y1), r2=15(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 171
LDI r2, 15
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

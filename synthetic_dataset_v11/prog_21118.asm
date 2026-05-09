; DESCRIPTION: Composite: . Then Renders a blue line between points (187, 24) and (193, 209). Then Places a magenta dot at position (74, 251).
; PLAN: r0=187(x1), r1=24(y1), r2=193(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=74(x), r1=251(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (187, 24) and (193, 209).
; PLAN: r0=187(x1), r1=24(y1), r2=193(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 24
LDI r2, 193
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (74, 251).
; PLAN: r0=74(x), r1=251(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 251
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT

; DESCRIPTION: Composite: . Then Places a black dot at position (106, 127). Then Renders a green line between points (48, 209) and (74, 206).
; PLAN: r0=106(x), r1=127(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=48(x1), r1=209(y1), r2=74(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (106, 127).
; PLAN: r0=106(x), r1=127(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 127
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a green line between points (48, 209) and (74, 206).
; PLAN: r0=48(x1), r1=209(y1), r2=74(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 209
LDI r2, 74
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

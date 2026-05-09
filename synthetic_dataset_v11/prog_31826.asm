; DESCRIPTION: Composite: . Then Places a magenta dot at position (138, 7). Then Renders a blue line between points (204, 134) and (191, 50).
; PLAN: r0=138(x), r1=7(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=204(x1), r1=134(y1), r2=191(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (138, 7).
; PLAN: r0=138(x), r1=7(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 7
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (204, 134) and (191, 50).
; PLAN: r0=204(x1), r1=134(y1), r2=191(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 134
LDI r2, 191
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

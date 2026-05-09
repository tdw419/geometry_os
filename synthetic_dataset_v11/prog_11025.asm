; DESCRIPTION: Composite: . Then Draws a blue line from (84, 165) to (135, 189). Then Places a blue dot at position (103, 143).
; PLAN: r0=84(x1), r1=165(y1), r2=135(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=103(x), r1=143(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue line from (84, 165) to (135, 189).
; PLAN: r0=84(x1), r1=165(y1), r2=135(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 165
LDI r2, 135
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (103, 143).
; PLAN: r0=103(x), r1=143(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 143
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT

; DESCRIPTION: Composite: . Then Places a yellow dot at position (181, 152). Then Draws a white line from (24, 219) to (125, 150).
; PLAN: r0=181(x), r1=152(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=24(x1), r1=219(y1), r2=125(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (181, 152).
; PLAN: r0=181(x), r1=152(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 152
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (24, 219) to (125, 150).
; PLAN: r0=24(x1), r1=219(y1), r2=125(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 219
LDI r2, 125
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

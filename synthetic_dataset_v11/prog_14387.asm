; DESCRIPTION: Composite: . Then Places a orange dot at position (92, 127). Then Renders a white line between points (57, 103) and (146, 17).
; PLAN: r0=92(x), r1=127(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=57(x1), r1=103(y1), r2=146(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (92, 127).
; PLAN: r0=92(x), r1=127(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 127
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a white line between points (57, 103) and (146, 17).
; PLAN: r0=57(x1), r1=103(y1), r2=146(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 103
LDI r2, 146
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

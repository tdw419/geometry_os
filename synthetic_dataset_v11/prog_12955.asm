; DESCRIPTION: Composite: . Then Renders a orange line between points (226, 237) and (191, 186). Then Places a orange dot at position (110, 29).
; PLAN: r0=226(x1), r1=237(y1), r2=191(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=110(x), r1=29(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (226, 237) and (191, 186).
; PLAN: r0=226(x1), r1=237(y1), r2=191(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 237
LDI r2, 191
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (110, 29).
; PLAN: r0=110(x), r1=29(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 29
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT

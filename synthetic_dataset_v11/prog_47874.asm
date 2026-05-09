; DESCRIPTION: Composite: . Then Places a orange dot at position (219, 35). Then Renders a red line between points (173, 25) and (201, 237).
; PLAN: r0=219(x), r1=35(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=173(x1), r1=25(y1), r2=201(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (219, 35).
; PLAN: r0=219(x), r1=35(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 219
LDI r1, 35
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (173, 25) and (201, 237).
; PLAN: r0=173(x1), r1=25(y1), r2=201(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 25
LDI r2, 201
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

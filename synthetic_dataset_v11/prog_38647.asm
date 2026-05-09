; DESCRIPTION: Composite: . Then Renders a black line between points (167, 113) and (173, 46). Then Places a orange dot at position (208, 32).
; PLAN: r0=167(x1), r1=113(y1), r2=173(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=208(x), r1=32(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (167, 113) and (173, 46).
; PLAN: r0=167(x1), r1=113(y1), r2=173(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 113
LDI r2, 173
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (208, 32).
; PLAN: r0=208(x), r1=32(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 32
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT

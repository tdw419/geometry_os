; DESCRIPTION: Renders a black line between points (214, 51) and (241, 171).
; PLAN: r0=214(x1), r1=51(y1), r2=241(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 51
LDI r2, 241
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

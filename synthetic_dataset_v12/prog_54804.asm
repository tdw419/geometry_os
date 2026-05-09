; DESCRIPTION: Renders a white line between points (51, 68) and (131, 210).
; PLAN: r0=51(x1), r1=68(y1), r2=131(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 68
LDI r2, 131
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan line between points (124, 51) and (57, 232).
; PLAN: r0=124(x1), r1=51(y1), r2=57(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 51
LDI r2, 57
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

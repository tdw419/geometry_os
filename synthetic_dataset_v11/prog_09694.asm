; DESCRIPTION: Renders a cyan line between points (51, 62) and (170, 164).
; PLAN: r0=51(x1), r1=62(y1), r2=170(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 62
LDI r2, 170
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

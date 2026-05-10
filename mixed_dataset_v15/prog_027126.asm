; DESCRIPTION: Renders a cyan line between points (170, 43) and (293, 33).
; PLAN: r0=170(x1), r1=43(y1), r2=293(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 43
LDI r2, 293
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

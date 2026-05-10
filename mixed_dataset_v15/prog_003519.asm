; DESCRIPTION: Renders a cyan line between points (473, 201) and (491, 5).
; PLAN: r0=473(x1), r1=201(y1), r2=491(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 201
LDI r2, 491
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

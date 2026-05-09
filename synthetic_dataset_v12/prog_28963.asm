; DESCRIPTION: Renders a cyan line between points (405, 201) and (54, 6).
; PLAN: r0=405(x1), r1=201(y1), r2=54(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 201
LDI r2, 54
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

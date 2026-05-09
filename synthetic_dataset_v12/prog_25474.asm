; DESCRIPTION: Renders a cyan line between points (391, 7) and (451, 31).
; PLAN: r0=391(x1), r1=7(y1), r2=451(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 7
LDI r2, 451
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

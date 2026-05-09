; DESCRIPTION: Renders a cyan line between points (47, 31) and (451, 174).
; PLAN: r0=47(x1), r1=31(y1), r2=451(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 31
LDI r2, 451
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

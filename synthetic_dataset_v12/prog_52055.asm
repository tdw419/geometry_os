; DESCRIPTION: Renders a cyan line between points (471, 59) and (212, 98).
; PLAN: r0=471(x1), r1=59(y1), r2=212(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 59
LDI r2, 212
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

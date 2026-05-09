; DESCRIPTION: Renders a cyan line between points (44, 102) and (232, 117).
; PLAN: r0=44(x1), r1=102(y1), r2=232(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 102
LDI r2, 232
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan line between points (232, 102) and (25, 171).
; PLAN: r0=232(x1), r1=102(y1), r2=25(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 102
LDI r2, 25
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

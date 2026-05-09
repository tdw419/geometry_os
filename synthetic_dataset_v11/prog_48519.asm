; DESCRIPTION: Renders a cyan line between points (191, 146) and (232, 207).
; PLAN: r0=191(x1), r1=146(y1), r2=232(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 146
LDI r2, 232
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

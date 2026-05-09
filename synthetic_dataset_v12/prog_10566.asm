; DESCRIPTION: Renders a cyan line between points (369, 59) and (498, 115).
; PLAN: r0=369(x1), r1=59(y1), r2=498(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 59
LDI r2, 498
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

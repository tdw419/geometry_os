; DESCRIPTION: Renders a cyan line between points (72, 114) and (500, 226).
; PLAN: r0=72(x1), r1=114(y1), r2=500(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 114
LDI r2, 500
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

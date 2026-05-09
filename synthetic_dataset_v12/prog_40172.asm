; DESCRIPTION: Renders a white line between points (272, 114) and (96, 47).
; PLAN: r0=272(x1), r1=114(y1), r2=96(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 114
LDI r2, 96
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

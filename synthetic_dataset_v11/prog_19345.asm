; DESCRIPTION: Renders a cyan line between points (122, 35) and (91, 112).
; PLAN: r0=122(x1), r1=35(y1), r2=91(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 35
LDI r2, 91
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

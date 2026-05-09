; DESCRIPTION: Renders a cyan line between points (106, 58) and (151, 225).
; PLAN: r0=106(x1), r1=58(y1), r2=151(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 58
LDI r2, 151
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

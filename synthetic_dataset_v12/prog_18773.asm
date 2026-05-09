; DESCRIPTION: Renders a cyan line between points (266, 178) and (81, 13).
; PLAN: r0=266(x1), r1=178(y1), r2=81(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 178
LDI r2, 81
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

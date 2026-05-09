; DESCRIPTION: Draws a cyan line from (81, 148) to (106, 119).
; PLAN: r0=81(x1), r1=148(y1), r2=106(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 148
LDI r2, 106
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

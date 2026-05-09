; DESCRIPTION: Renders a yellow line between points (125, 206) and (31, 164).
; PLAN: r0=125(x1), r1=206(y1), r2=31(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 206
LDI r2, 31
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

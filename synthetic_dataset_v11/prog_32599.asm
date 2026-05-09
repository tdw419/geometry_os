; DESCRIPTION: Renders a cyan line between points (132, 161) and (221, 142).
; PLAN: r0=132(x1), r1=161(y1), r2=221(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 161
LDI r2, 221
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan line between points (211, 34) and (197, 149).
; PLAN: r0=211(x1), r1=34(y1), r2=197(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 34
LDI r2, 197
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan line between points (302, 25) and (427, 171).
; PLAN: r0=302(x1), r1=25(y1), r2=427(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 25
LDI r2, 427
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

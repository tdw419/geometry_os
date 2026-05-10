; DESCRIPTION: Renders a cyan line between points (393, 53) and (282, 149).
; PLAN: r0=393(x1), r1=53(y1), r2=282(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 53
LDI r2, 282
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

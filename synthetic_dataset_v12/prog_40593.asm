; DESCRIPTION: Renders a cyan line between points (469, 139) and (302, 220).
; PLAN: r0=469(x1), r1=139(y1), r2=302(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 139
LDI r2, 302
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

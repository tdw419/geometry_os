; DESCRIPTION: Renders a cyan line between points (117, 236) and (3, 158).
; PLAN: r0=117(x1), r1=236(y1), r2=3(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 236
LDI r2, 3
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

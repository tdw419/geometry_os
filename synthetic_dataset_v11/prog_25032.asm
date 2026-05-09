; DESCRIPTION: Renders a cyan line between points (76, 2) and (101, 220).
; PLAN: r0=76(x1), r1=2(y1), r2=101(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 2
LDI r2, 101
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

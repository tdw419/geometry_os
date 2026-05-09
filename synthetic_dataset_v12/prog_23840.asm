; DESCRIPTION: Renders a cyan line between points (101, 56) and (49, 65).
; PLAN: r0=101(x1), r1=56(y1), r2=49(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 56
LDI r2, 49
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

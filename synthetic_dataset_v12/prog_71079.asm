; DESCRIPTION: Renders a cyan line between points (24, 52) and (65, 44).
; PLAN: r0=24(x1), r1=52(y1), r2=65(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 52
LDI r2, 65
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

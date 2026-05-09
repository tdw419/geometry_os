; DESCRIPTION: Renders a cyan line between points (176, 181) and (6, 65).
; PLAN: r0=176(x1), r1=181(y1), r2=6(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 181
LDI r2, 6
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

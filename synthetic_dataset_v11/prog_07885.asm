; DESCRIPTION: Renders a cyan line between points (188, 236) and (233, 23).
; PLAN: r0=188(x1), r1=236(y1), r2=233(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 236
LDI r2, 233
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

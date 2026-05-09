; DESCRIPTION: Renders a cyan line between points (27, 86) and (188, 102).
; PLAN: r0=27(x1), r1=86(y1), r2=188(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 86
LDI r2, 188
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan line between points (226, 163) and (123, 127).
; PLAN: r0=226(x1), r1=163(y1), r2=123(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 163
LDI r2, 123
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

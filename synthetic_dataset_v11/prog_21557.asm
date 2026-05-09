; DESCRIPTION: Renders a cyan line between points (117, 163) and (183, 74).
; PLAN: r0=117(x1), r1=163(y1), r2=183(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 163
LDI r2, 183
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan line between points (183, 14) and (183, 198).
; PLAN: r0=183(x1), r1=14(y1), r2=183(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 14
LDI r2, 183
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

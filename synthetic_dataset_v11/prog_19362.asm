; DESCRIPTION: Renders a cyan line between points (226, 233) and (220, 248).
; PLAN: r0=226(x1), r1=233(y1), r2=220(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 233
LDI r2, 220
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

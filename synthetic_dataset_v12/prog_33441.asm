; DESCRIPTION: Renders a cyan line between points (299, 118) and (27, 81).
; PLAN: r0=299(x1), r1=118(y1), r2=27(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 118
LDI r2, 27
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

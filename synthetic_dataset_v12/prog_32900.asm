; DESCRIPTION: Renders a cyan line between points (419, 215) and (484, 158).
; PLAN: r0=419(x1), r1=215(y1), r2=484(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 215
LDI r2, 484
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

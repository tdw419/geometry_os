; DESCRIPTION: Draws a cyan line from (419, 140) to (507, 93).
; PLAN: r0=419(x1), r1=140(y1), r2=507(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 140
LDI r2, 507
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

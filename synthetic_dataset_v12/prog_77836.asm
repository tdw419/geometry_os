; DESCRIPTION: Draws a cyan line from (93, 210) to (413, 159).
; PLAN: r0=93(x1), r1=210(y1), r2=413(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 210
LDI r2, 413
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

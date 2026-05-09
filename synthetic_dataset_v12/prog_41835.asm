; DESCRIPTION: Renders a cyan line between points (428, 183) and (467, 254).
; PLAN: r0=428(x1), r1=183(y1), r2=467(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 183
LDI r2, 467
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

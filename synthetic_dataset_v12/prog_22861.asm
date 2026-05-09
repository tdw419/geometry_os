; DESCRIPTION: Draws a cyan line from (463, 142) to (477, 214).
; PLAN: r0=463(x1), r1=142(y1), r2=477(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 142
LDI r2, 477
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

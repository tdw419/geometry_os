; DESCRIPTION: Renders a cyan line between points (94, 214) and (31, 181).
; PLAN: r0=94(x1), r1=214(y1), r2=31(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 214
LDI r2, 31
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

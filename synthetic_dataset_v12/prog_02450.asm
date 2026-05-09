; DESCRIPTION: Renders a cyan line between points (343, 142) and (383, 234).
; PLAN: r0=343(x1), r1=142(y1), r2=383(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 142
LDI r2, 383
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

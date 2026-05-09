; DESCRIPTION: Renders a cyan line between points (236, 233) and (3, 181).
; PLAN: r0=236(x1), r1=233(y1), r2=3(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 233
LDI r2, 3
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

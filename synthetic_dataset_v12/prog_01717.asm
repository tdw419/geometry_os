; DESCRIPTION: Renders a cyan line between points (349, 110) and (247, 182).
; PLAN: r0=349(x1), r1=110(y1), r2=247(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 110
LDI r2, 247
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

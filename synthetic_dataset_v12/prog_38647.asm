; DESCRIPTION: Draws a cyan line from (478, 81) to (73, 142).
; PLAN: r0=478(x1), r1=81(y1), r2=73(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 81
LDI r2, 73
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

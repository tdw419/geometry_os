; DESCRIPTION: Draws a cyan line from (312, 33) to (300, 238).
; PLAN: r0=312(x1), r1=33(y1), r2=300(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 33
LDI r2, 300
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

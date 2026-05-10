; DESCRIPTION: Draws a cyan line from (312, 33) to (134, 72).
; PLAN: r0=312(x1), r1=33(y1), r2=134(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 33
LDI r2, 134
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (100, 47) to (24, 122).
; PLAN: r0=100(x1), r1=47(y1), r2=24(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 47
LDI r2, 24
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

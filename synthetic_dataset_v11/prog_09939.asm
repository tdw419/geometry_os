; DESCRIPTION: Draws a cyan line from (10, 38) to (55, 158).
; PLAN: r0=10(x1), r1=38(y1), r2=55(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 38
LDI r2, 55
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

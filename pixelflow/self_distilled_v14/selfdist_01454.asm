; DESCRIPTION: Draws a cyan line from (47, 84) to (123, 194).
; PLAN: r0=47(x1), r1=84(y1), r2=123(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 84
LDI r2, 123
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (14, 44) to (101, 212).
; PLAN: r0=14(x1), r1=44(y1), r2=101(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 44
LDI r2, 101
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

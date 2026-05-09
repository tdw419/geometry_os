; DESCRIPTION: Draws a cyan line from (9, 44) to (158, 0).
; PLAN: r0=9(x1), r1=44(y1), r2=158(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 44
LDI r2, 158
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

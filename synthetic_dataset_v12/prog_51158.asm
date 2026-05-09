; DESCRIPTION: Draws a cyan line from (90, 139) to (101, 10).
; PLAN: r0=90(x1), r1=139(y1), r2=101(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 139
LDI r2, 101
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (302, 139) to (20, 6).
; PLAN: r0=302(x1), r1=139(y1), r2=20(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 139
LDI r2, 20
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

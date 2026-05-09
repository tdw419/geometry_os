; DESCRIPTION: Draws a cyan line from (161, 94) to (2, 200).
; PLAN: r0=161(x1), r1=94(y1), r2=2(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 94
LDI r2, 2
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

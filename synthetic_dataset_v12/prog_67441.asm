; DESCRIPTION: Draws a cyan line from (200, 26) to (46, 81).
; PLAN: r0=200(x1), r1=26(y1), r2=46(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 26
LDI r2, 46
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

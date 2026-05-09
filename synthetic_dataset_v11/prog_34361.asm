; DESCRIPTION: Draws a cyan line from (62, 212) to (161, 71).
; PLAN: r0=62(x1), r1=212(y1), r2=161(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 212
LDI r2, 161
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (363, 122) to (100, 71).
; PLAN: r0=363(x1), r1=122(y1), r2=100(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 122
LDI r2, 100
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

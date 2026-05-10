; DESCRIPTION: Draws a cyan line from (363, 41) to (90, 70).
; PLAN: r0=363(x1), r1=41(y1), r2=90(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 41
LDI r2, 90
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

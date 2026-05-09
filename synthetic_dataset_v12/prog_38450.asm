; DESCRIPTION: Draws a cyan line from (507, 212) to (115, 76).
; PLAN: r0=507(x1), r1=212(y1), r2=115(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 212
LDI r2, 115
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

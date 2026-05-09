; DESCRIPTION: Draws a cyan line from (41, 31) to (435, 139).
; PLAN: r0=41(x1), r1=31(y1), r2=435(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 31
LDI r2, 435
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

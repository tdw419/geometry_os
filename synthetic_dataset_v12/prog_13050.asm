; DESCRIPTION: Draws a orange line from (339, 40) to (295, 139).
; PLAN: r0=339(x1), r1=40(y1), r2=295(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 40
LDI r2, 295
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

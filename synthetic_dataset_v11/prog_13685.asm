; DESCRIPTION: Draws a cyan line from (243, 170) to (14, 190).
; PLAN: r0=243(x1), r1=170(y1), r2=14(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 170
LDI r2, 14
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (395, 84) to (96, 190).
; PLAN: r0=395(x1), r1=84(y1), r2=96(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 84
LDI r2, 96
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

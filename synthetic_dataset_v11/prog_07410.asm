; DESCRIPTION: Draws a cyan line from (110, 98) to (222, 131).
; PLAN: r0=110(x1), r1=98(y1), r2=222(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 98
LDI r2, 222
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

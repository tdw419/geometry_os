; DESCRIPTION: Draws a cyan line from (431, 77) to (111, 139).
; PLAN: r0=431(x1), r1=77(y1), r2=111(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 77
LDI r2, 111
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

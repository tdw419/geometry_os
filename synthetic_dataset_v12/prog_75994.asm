; DESCRIPTION: Draws a cyan line from (110, 92) to (204, 13).
; PLAN: r0=110(x1), r1=92(y1), r2=204(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 92
LDI r2, 204
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

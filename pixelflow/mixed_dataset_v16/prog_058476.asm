; DESCRIPTION: Draws a cyan line from (23, 217) to (475, 102).
; PLAN: r0=23(x1), r1=217(y1), r2=475(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 217
LDI r2, 475
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

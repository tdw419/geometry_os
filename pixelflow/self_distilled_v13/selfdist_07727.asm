; DESCRIPTION: Draws a cyan line from (342, 92) to (52, 130).
; PLAN: r0=342(x1), r1=92(y1), r2=52(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 92
LDI r2, 52
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (130, 118) to (96, 72).
; PLAN: r0=130(x1), r1=118(y1), r2=96(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 118
LDI r2, 96
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

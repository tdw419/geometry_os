; DESCRIPTION: Draws a cyan line from (457, 11) to (504, 74).
; PLAN: r0=457(x1), r1=11(y1), r2=504(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 11
LDI r2, 504
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

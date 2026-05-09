; DESCRIPTION: Renders a cyan line between points (410, 118) and (312, 13).
; PLAN: r0=410(x1), r1=118(y1), r2=312(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 118
LDI r2, 312
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

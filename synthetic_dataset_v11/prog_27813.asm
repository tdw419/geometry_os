; DESCRIPTION: Draws a cyan line from (93, 7) to (52, 196).
; PLAN: r0=93(x1), r1=7(y1), r2=52(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 7
LDI r2, 52
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

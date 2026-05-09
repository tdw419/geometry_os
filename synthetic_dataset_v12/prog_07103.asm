; DESCRIPTION: Draws a cyan line from (124, 7) to (231, 77).
; PLAN: r0=124(x1), r1=7(y1), r2=231(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 7
LDI r2, 231
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

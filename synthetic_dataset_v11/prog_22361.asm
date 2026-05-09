; DESCRIPTION: Draws a cyan line from (56, 115) to (110, 87).
; PLAN: r0=56(x1), r1=115(y1), r2=110(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 115
LDI r2, 110
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (115, 35) to (471, 17).
; PLAN: r0=115(x1), r1=35(y1), r2=471(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 35
LDI r2, 471
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

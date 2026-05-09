; DESCRIPTION: Draws a cyan line from (506, 25) to (54, 119).
; PLAN: r0=506(x1), r1=25(y1), r2=54(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 25
LDI r2, 54
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

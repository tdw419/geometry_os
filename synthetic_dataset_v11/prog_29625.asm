; DESCRIPTION: Draws a cyan line from (50, 34) to (101, 159).
; PLAN: r0=50(x1), r1=34(y1), r2=101(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 34
LDI r2, 101
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

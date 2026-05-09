; DESCRIPTION: Draws a cyan line from (191, 11) to (101, 95).
; PLAN: r0=191(x1), r1=11(y1), r2=101(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 11
LDI r2, 101
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

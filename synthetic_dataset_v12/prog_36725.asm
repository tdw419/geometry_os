; DESCRIPTION: Draws a cyan line from (132, 33) to (156, 158).
; PLAN: r0=132(x1), r1=33(y1), r2=156(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 33
LDI r2, 156
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

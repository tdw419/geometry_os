; DESCRIPTION: Renders a green line between points (212, 39) and (179, 95).
; PLAN: r0=212(x1), r1=39(y1), r2=179(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 39
LDI r2, 179
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

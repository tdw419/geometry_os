; DESCRIPTION: Renders a cyan line between points (179, 135) and (183, 100).
; PLAN: r0=179(x1), r1=135(y1), r2=183(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 135
LDI r2, 183
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

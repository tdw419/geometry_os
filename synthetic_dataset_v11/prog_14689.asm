; DESCRIPTION: Draws a cyan line from (118, 73) to (244, 75).
; PLAN: r0=118(x1), r1=73(y1), r2=244(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 73
LDI r2, 244
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

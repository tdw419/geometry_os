; DESCRIPTION: Draws a cyan line from (174, 34) to (456, 77).
; PLAN: r0=174(x1), r1=34(y1), r2=456(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 34
LDI r2, 456
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

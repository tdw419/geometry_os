; DESCRIPTION: Draws a cyan line from (181, 75) to (39, 38).
; PLAN: r0=181(x1), r1=75(y1), r2=39(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 75
LDI r2, 39
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

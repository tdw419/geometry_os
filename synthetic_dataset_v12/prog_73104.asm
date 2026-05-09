; DESCRIPTION: Draws a green line from (334, 31) to (182, 75).
; PLAN: r0=334(x1), r1=31(y1), r2=182(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 31
LDI r2, 182
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

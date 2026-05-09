; DESCRIPTION: Draws a cyan line from (334, 251) to (48, 252).
; PLAN: r0=334(x1), r1=251(y1), r2=48(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 251
LDI r2, 48
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

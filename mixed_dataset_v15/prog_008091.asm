; DESCRIPTION: Draws a cyan line from (285, 89) to (49, 226).
; PLAN: r0=285(x1), r1=89(y1), r2=49(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 89
LDI r2, 49
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

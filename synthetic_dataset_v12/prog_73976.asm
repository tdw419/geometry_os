; DESCRIPTION: Draws a cyan line from (334, 198) to (226, 49).
; PLAN: r0=334(x1), r1=198(y1), r2=226(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 198
LDI r2, 226
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (355, 81) to (1, 128).
; PLAN: r0=355(x1), r1=81(y1), r2=1(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 81
LDI r2, 1
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

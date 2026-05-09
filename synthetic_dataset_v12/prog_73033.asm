; DESCRIPTION: Draws a cyan line from (355, 202) to (511, 62).
; PLAN: r0=355(x1), r1=202(y1), r2=511(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 202
LDI r2, 511
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

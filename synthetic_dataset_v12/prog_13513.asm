; DESCRIPTION: Draws a cyan line from (233, 167) to (325, 33).
; PLAN: r0=233(x1), r1=167(y1), r2=325(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 167
LDI r2, 325
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

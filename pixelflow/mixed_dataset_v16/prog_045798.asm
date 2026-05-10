; DESCRIPTION: Places a cyan line segment connecting (217, 167) to (385, 11).
; PLAN: r0=217(x1), r1=167(y1), r2=385(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 167
LDI r2, 385
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

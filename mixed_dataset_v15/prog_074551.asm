; DESCRIPTION: Draws a green line from (66, 112) to (499, 218).
; PLAN: r0=66(x1), r1=112(y1), r2=499(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 112
LDI r2, 499
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

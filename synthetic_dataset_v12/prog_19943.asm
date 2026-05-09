; DESCRIPTION: Draws a yellow line from (275, 24) to (103, 218).
; PLAN: r0=275(x1), r1=24(y1), r2=103(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 24
LDI r2, 103
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (333, 218) to (274, 33).
; PLAN: r0=333(x1), r1=218(y1), r2=274(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 218
LDI r2, 274
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (439, 1) to (19, 249).
; PLAN: r0=439(x1), r1=1(y1), r2=19(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 1
LDI r2, 19
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

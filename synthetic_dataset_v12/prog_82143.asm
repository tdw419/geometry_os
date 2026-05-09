; DESCRIPTION: Draws a green line from (328, 145) to (469, 126).
; PLAN: r0=328(x1), r1=145(y1), r2=469(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 145
LDI r2, 469
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (137, 126) to (57, 170).
; PLAN: r0=137(x1), r1=126(y1), r2=57(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 126
LDI r2, 57
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

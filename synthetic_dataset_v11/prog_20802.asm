; DESCRIPTION: Draws a green line from (186, 203) to (247, 170).
; PLAN: r0=186(x1), r1=203(y1), r2=247(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 203
LDI r2, 247
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

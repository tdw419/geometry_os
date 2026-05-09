; DESCRIPTION: Draws a green line from (57, 186) to (11, 36).
; PLAN: r0=57(x1), r1=186(y1), r2=11(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 186
LDI r2, 11
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (177, 208) to (39, 15).
; PLAN: r0=177(x1), r1=208(y1), r2=39(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 208
LDI r2, 39
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

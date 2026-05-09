; DESCRIPTION: Draws a green line from (330, 211) to (352, 177).
; PLAN: r0=330(x1), r1=211(y1), r2=352(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 211
LDI r2, 352
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (413, 19) to (269, 161).
; PLAN: r0=413(x1), r1=19(y1), r2=269(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 19
LDI r2, 269
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

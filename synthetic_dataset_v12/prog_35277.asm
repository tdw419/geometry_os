; DESCRIPTION: Draws a green line from (251, 215) to (469, 205).
; PLAN: r0=251(x1), r1=215(y1), r2=469(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 215
LDI r2, 469
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

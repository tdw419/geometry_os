; DESCRIPTION: Draws a white line from (215, 119) to (195, 26).
; PLAN: r0=215(x1), r1=119(y1), r2=195(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 119
LDI r2, 195
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

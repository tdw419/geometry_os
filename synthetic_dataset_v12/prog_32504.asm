; DESCRIPTION: Draws a white line from (215, 14) to (76, 251).
; PLAN: r0=215(x1), r1=14(y1), r2=76(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 14
LDI r2, 76
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

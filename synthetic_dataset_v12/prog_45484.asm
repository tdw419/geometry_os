; DESCRIPTION: Draws a cyan line from (331, 85) to (331, 115).
; PLAN: r0=331(x1), r1=85(y1), r2=331(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 85
LDI r2, 331
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

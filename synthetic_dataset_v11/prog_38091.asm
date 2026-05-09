; DESCRIPTION: Draws a green line from (210, 87) to (179, 179).
; PLAN: r0=210(x1), r1=87(y1), r2=179(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 87
LDI r2, 179
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

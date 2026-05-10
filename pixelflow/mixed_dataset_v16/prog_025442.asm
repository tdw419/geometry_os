; DESCRIPTION: Draws a black line from (16, 61) to (434, 179).
; PLAN: r0=16(x1), r1=61(y1), r2=434(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 61
LDI r2, 434
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

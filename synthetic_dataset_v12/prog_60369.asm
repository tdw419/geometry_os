; DESCRIPTION: Draws a white line from (371, 143) to (85, 193).
; PLAN: r0=371(x1), r1=143(y1), r2=85(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 143
LDI r2, 85
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white line from (480, 158) to (87, 82).
; PLAN: r0=480(x1), r1=158(y1), r2=87(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 158
LDI r2, 87
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

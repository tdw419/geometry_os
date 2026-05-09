; DESCRIPTION: Draws a white line from (60, 165) to (87, 149).
; PLAN: r0=60(x1), r1=165(y1), r2=87(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 165
LDI r2, 87
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white line from (60, 32) to (9, 244).
; PLAN: r0=60(x1), r1=32(y1), r2=9(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 32
LDI r2, 9
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

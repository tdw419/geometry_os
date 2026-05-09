; DESCRIPTION: Draws a white line from (428, 244) to (442, 90).
; PLAN: r0=428(x1), r1=244(y1), r2=442(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 244
LDI r2, 442
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

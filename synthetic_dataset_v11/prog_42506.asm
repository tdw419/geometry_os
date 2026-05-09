; DESCRIPTION: Places a white line segment connecting (180, 164) to (85, 206).
; PLAN: r0=180(x1), r1=164(y1), r2=85(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 164
LDI r2, 85
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

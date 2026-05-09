; DESCRIPTION: Draws a white line from (184, 83) to (180, 32).
; PLAN: r0=184(x1), r1=83(y1), r2=180(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 83
LDI r2, 180
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

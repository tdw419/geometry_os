; DESCRIPTION: Draws a white line from (30, 180) to (195, 239).
; PLAN: r0=30(x1), r1=180(y1), r2=195(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 180
LDI r2, 195
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

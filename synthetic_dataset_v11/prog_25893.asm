; DESCRIPTION: Draws a white line from (0, 126) to (180, 69).
; PLAN: r0=0(x1), r1=126(y1), r2=180(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 126
LDI r2, 180
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

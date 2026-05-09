; DESCRIPTION: Draws a white line from (205, 120) to (291, 50).
; PLAN: r0=205(x1), r1=120(y1), r2=291(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 120
LDI r2, 291
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

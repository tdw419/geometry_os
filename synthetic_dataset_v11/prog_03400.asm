; DESCRIPTION: Draws a white line from (237, 17) to (60, 126).
; PLAN: r0=237(x1), r1=17(y1), r2=60(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 17
LDI r2, 60
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

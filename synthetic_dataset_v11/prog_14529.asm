; DESCRIPTION: Draws a white line from (50, 114) to (147, 173).
; PLAN: r0=50(x1), r1=114(y1), r2=147(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 114
LDI r2, 147
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white line from (220, 148) to (239, 15).
; PLAN: r0=220(x1), r1=148(y1), r2=239(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 148
LDI r2, 239
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

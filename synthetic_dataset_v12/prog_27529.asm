; DESCRIPTION: Draws a white line from (227, 239) to (237, 173).
; PLAN: r0=227(x1), r1=239(y1), r2=237(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 239
LDI r2, 237
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

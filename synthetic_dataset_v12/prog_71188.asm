; DESCRIPTION: Draws a white line from (176, 28) to (239, 219).
; PLAN: r0=176(x1), r1=28(y1), r2=239(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 28
LDI r2, 239
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

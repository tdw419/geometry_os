; DESCRIPTION: Draws a white line from (424, 200) to (215, 62).
; PLAN: r0=424(x1), r1=200(y1), r2=215(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 200
LDI r2, 215
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

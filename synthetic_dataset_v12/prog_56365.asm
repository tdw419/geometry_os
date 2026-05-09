; DESCRIPTION: Draws a white line from (424, 93) to (206, 92).
; PLAN: r0=424(x1), r1=93(y1), r2=206(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 93
LDI r2, 206
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

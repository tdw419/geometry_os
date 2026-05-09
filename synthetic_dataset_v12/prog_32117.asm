; DESCRIPTION: Draws a white line from (464, 151) to (214, 100).
; PLAN: r0=464(x1), r1=151(y1), r2=214(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 151
LDI r2, 214
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

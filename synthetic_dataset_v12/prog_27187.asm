; DESCRIPTION: Draws a white line from (388, 53) to (464, 218).
; PLAN: r0=388(x1), r1=53(y1), r2=464(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 53
LDI r2, 464
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

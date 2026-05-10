; DESCRIPTION: Draws a white line from (60, 24) to (387, 43).
; PLAN: r0=60(x1), r1=24(y1), r2=387(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 24
LDI r2, 387
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

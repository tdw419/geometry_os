; DESCRIPTION: Draws a white line from (12, 121) to (32, 117).
; PLAN: r0=12(x1), r1=121(y1), r2=32(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 121
LDI r2, 32
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

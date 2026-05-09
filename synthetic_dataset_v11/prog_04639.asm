; DESCRIPTION: Draws a white line from (18, 93) to (121, 32).
; PLAN: r0=18(x1), r1=93(y1), r2=121(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 93
LDI r2, 121
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

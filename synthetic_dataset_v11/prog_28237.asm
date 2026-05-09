; DESCRIPTION: Draws a white line from (138, 36) to (114, 103).
; PLAN: r0=138(x1), r1=36(y1), r2=114(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 36
LDI r2, 114
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

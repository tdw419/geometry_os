; DESCRIPTION: Draws a white line from (292, 60) to (138, 113).
; PLAN: r0=292(x1), r1=60(y1), r2=138(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 60
LDI r2, 138
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

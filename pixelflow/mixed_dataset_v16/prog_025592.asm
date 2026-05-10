; DESCRIPTION: Draws a white line from (70, 60) to (247, 113).
; PLAN: r0=70(x1), r1=60(y1), r2=247(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 60
LDI r2, 247
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white line from (408, 138) to (450, 240).
; PLAN: r0=408(x1), r1=138(y1), r2=450(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 138
LDI r2, 450
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

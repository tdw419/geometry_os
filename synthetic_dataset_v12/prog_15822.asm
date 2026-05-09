; DESCRIPTION: Draws a white line from (25, 220) to (30, 152).
; PLAN: r0=25(x1), r1=220(y1), r2=30(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 220
LDI r2, 30
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

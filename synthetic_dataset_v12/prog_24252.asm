; DESCRIPTION: Draws a blue line from (138, 22) to (502, 152).
; PLAN: r0=138(x1), r1=22(y1), r2=502(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 22
LDI r2, 502
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

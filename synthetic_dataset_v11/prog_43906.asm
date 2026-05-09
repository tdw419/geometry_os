; DESCRIPTION: Draws a white line from (11, 196) to (84, 171).
; PLAN: r0=11(x1), r1=196(y1), r2=84(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 196
LDI r2, 84
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

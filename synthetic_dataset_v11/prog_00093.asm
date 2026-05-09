; DESCRIPTION: Draws a white line from (84, 207) to (24, 209).
; PLAN: r0=84(x1), r1=207(y1), r2=24(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 207
LDI r2, 24
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

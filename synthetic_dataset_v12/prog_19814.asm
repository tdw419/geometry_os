; DESCRIPTION: Draws a white line from (455, 219) to (182, 48).
; PLAN: r0=455(x1), r1=219(y1), r2=182(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 219
LDI r2, 182
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

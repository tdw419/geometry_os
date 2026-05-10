; DESCRIPTION: Draws a white line from (330, 76) to (16, 123).
; PLAN: r0=330(x1), r1=76(y1), r2=16(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 76
LDI r2, 16
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

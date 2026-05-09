; DESCRIPTION: Draws a white line from (202, 55) to (493, 89).
; PLAN: r0=202(x1), r1=55(y1), r2=493(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 55
LDI r2, 493
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

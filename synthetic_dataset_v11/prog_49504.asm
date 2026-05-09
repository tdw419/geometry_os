; DESCRIPTION: Draws a orange line from (233, 177) to (202, 32).
; PLAN: r0=233(x1), r1=177(y1), r2=202(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 177
LDI r2, 202
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

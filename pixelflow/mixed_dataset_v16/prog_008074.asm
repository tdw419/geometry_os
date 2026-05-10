; DESCRIPTION: Draws a white line from (463, 177) to (28, 253).
; PLAN: r0=463(x1), r1=177(y1), r2=28(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 177
LDI r2, 28
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

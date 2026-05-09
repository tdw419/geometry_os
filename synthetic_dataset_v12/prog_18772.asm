; DESCRIPTION: Draws a white line from (388, 21) to (167, 32).
; PLAN: r0=388(x1), r1=21(y1), r2=167(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 21
LDI r2, 167
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

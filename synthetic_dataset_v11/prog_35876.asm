; DESCRIPTION: Draws a black line from (176, 247) to (167, 48).
; PLAN: r0=176(x1), r1=247(y1), r2=167(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 247
LDI r2, 167
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

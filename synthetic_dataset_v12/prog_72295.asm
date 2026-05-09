; DESCRIPTION: Draws a white line from (92, 193) to (160, 57).
; PLAN: r0=92(x1), r1=193(y1), r2=160(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 193
LDI r2, 160
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

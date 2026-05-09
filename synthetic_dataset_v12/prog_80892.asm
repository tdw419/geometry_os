; DESCRIPTION: Draws a white line from (92, 27) to (216, 226).
; PLAN: r0=92(x1), r1=27(y1), r2=216(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 27
LDI r2, 216
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

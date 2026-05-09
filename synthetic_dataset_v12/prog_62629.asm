; DESCRIPTION: Renders a yellow line between points (39, 28) and (92, 171).
; PLAN: r0=39(x1), r1=28(y1), r2=92(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 28
LDI r2, 92
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

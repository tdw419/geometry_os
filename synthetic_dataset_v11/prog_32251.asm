; DESCRIPTION: Renders a black line between points (49, 7) and (92, 228).
; PLAN: r0=49(x1), r1=7(y1), r2=92(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 7
LDI r2, 92
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

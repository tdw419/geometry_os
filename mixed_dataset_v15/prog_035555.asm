; DESCRIPTION: Renders a cyan line segment connecting (92, 48) to (175, 116).
; PLAN: r0=92(x1), r1=48(y1), r2=175(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 48
LDI r2, 175
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

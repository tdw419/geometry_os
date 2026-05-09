; DESCRIPTION: Renders a yellow line between points (92, 42) and (495, 151).
; PLAN: r0=92(x1), r1=42(y1), r2=495(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 42
LDI r2, 495
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

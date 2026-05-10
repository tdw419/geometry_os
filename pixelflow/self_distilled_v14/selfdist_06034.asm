; DESCRIPTION: Renders a cyan line segment connecting (387, 73) to (102, 154).
; PLAN: r0=387(x1), r1=73(y1), r2=102(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 73
LDI r2, 102
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

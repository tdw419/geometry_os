; DESCRIPTION: Places a cyan line segment connecting (92, 86) to (33, 28).
; PLAN: r0=92(x1), r1=86(y1), r2=33(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 86
LDI r2, 33
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan line segment connecting (288, 56) to (73, 96).
; PLAN: r0=288(x1), r1=56(y1), r2=73(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 56
LDI r2, 73
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

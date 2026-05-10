; DESCRIPTION: Renders a cyan line segment connecting (48, 64) to (377, 11).
; PLAN: r0=48(x1), r1=64(y1), r2=377(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 64
LDI r2, 377
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

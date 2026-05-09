; DESCRIPTION: Renders a cyan line between points (80, 1) and (1, 182).
; PLAN: r0=80(x1), r1=1(y1), r2=1(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 1
LDI r2, 1
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

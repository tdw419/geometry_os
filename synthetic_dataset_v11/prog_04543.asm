; DESCRIPTION: Renders a cyan line between points (124, 56) and (21, 182).
; PLAN: r0=124(x1), r1=56(y1), r2=21(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 56
LDI r2, 21
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

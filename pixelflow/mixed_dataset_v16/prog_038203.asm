; DESCRIPTION: Renders a cyan line between points (414, 225) and (493, 81).
; PLAN: r0=414(x1), r1=225(y1), r2=493(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 225
LDI r2, 493
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

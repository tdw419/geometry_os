; DESCRIPTION: Renders a cyan line between points (5, 225) and (3, 48).
; PLAN: r0=5(x1), r1=225(y1), r2=3(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 225
LDI r2, 3
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

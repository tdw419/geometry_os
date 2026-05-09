; DESCRIPTION: Renders a cyan line between points (27, 8) and (55, 22).
; PLAN: r0=27(x1), r1=8(y1), r2=55(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 8
LDI r2, 55
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

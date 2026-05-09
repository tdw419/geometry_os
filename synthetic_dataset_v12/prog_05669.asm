; DESCRIPTION: Renders a cyan line between points (343, 99) and (280, 0).
; PLAN: r0=343(x1), r1=99(y1), r2=280(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 99
LDI r2, 280
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

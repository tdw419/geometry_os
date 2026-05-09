; DESCRIPTION: Renders a cyan line between points (76, 113) and (444, 3).
; PLAN: r0=76(x1), r1=113(y1), r2=444(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 113
LDI r2, 444
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

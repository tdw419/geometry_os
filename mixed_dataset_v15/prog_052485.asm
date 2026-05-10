; DESCRIPTION: Renders a cyan line between points (444, 6) and (12, 223).
; PLAN: r0=444(x1), r1=6(y1), r2=12(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 6
LDI r2, 12
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

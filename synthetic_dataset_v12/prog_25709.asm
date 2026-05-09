; DESCRIPTION: Renders a cyan line between points (74, 193) and (426, 6).
; PLAN: r0=74(x1), r1=193(y1), r2=426(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 193
LDI r2, 426
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
